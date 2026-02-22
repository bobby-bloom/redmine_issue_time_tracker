import 'package:collection/collection.dart';
import 'package:ritt/app/models/timer.dart';
import 'package:ritt/app/providers/app_store.dart';
import 'package:ritt/app/providers/settings.dart';
import 'package:ritt/redmine/models/redmine_issue.dart';
import 'package:ritt/redmine/providers/redmine_issue.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timers.g.dart';

@Riverpod(dependencies: [appStore, Settings, redmineIssue])
class Timers extends _$Timers {
  final storeKey = AppKeys.timers;

  @override
  List<Timer> build() {
    final appStore = ref.watch(appStoreProvider);
    ref.watch(settingsProvider);

    return appStore.read(storeKey) ?? [];
  }

  void reset(String id) {
    state = state.map((timer) {
      if (timer.id == id) {
        return timer.copyWith(
          totalTime: Duration.zero,
          isRunning: false,
          lastStartOn: null,
        );
      }
      return timer;
    }).toList();

    _writeState();
  }

  Timer toggle(Timer timer) {
    if (timer.isRunning) {
      timer = _stop(timer);
    } else {
      timer = _start(timer);
    }

    state = state.map((x) {
      if (x.id == timer.id) {
        return timer;
      }

      return x;
    }).toList();

    _writeState();

    return timer;
  }

  void remove(String id) {
    state = state.where((t) => t.id != id).toList();

    _writeState();
  }

  void removeAll() {
    state = [];

    _writeState();
  }

  Future<void> create({int? issueId, RedmineIssue? issue}) async {
    RedmineIssue? issueOut = issue;

    if (issue == null && issueId != null ||
        issueId != null && issueId != issue?.id) {
      issueOut = await ref.read(redmineIssueProvider(issueId).future);
    }

    final newTimer = Timer(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      totalTime: Duration.zero,
      isRunning: false,
      issueId: issueId,
      issue: issueOut,
    );

    state = [newTimer, ...state];

    _writeState();
  }

  Future<void> update(String id, {int? issueId, RedmineIssue? issue}) async {
    RedmineIssue? issueOut = issue;

    if (issue == null && issueId != null && issueId != issue?.id) {
      issueOut = await ref.read(redmineIssueProvider(issueId).future);
    }

    state = state.map((timer) {
      if (timer.id == id) {
        return timer.copyWith(issueId: issueId, issue: issueOut);
      }
      return timer;
    }).toList();

    _writeState();
  }

  Future<void> fetchIssue(String id) async {
    final timer = state.where((x) => x.id == id).firstOrNull;
    if (timer == null) {
      return;
    }

    final issueId = timer.issue?.id ?? timer.issueId;
    if (issueId == null) {
      return;
    }

    final issue = await ref.read(redmineIssueProvider(issueId).future);

    final timerIdx = state.indexOf(timer);

    state.replaceRange(timerIdx, timerIdx + 1, [
      timer.copyWith(issue: issue, issueId: issue?.id),
    ]);

    state = [...state];
  }

  void set(List<Timer> timers) {
    state = timers;

    _writeState();
  }

  Timer _stop(Timer timer) {
    if (!timer.isRunning) {
      return timer;
    }

    final elapsed = DateTime.timestamp().difference(timer.lastStartOn!);

    return timer.copyWith(
      isRunning: false,
      totalTime: timer.totalTime + elapsed,
      lastStartOn: null,
    );
  }

  Timer _start(Timer timer) {
    final settings = ref.read(settingsProvider);

    final allowTimesRunningSimultaneously =
        settings.runMultipleTimersSimultaneously;

    if (!allowTimesRunningSimultaneously) {
      state = state.map((x) => _stop(x)).toList();
    }

    return timer.copyWith(isRunning: true, lastStartOn: .timestamp());
  }

  void _writeState() {
    ref.read(appStoreProvider).write(storeKey, state);
  }
}
