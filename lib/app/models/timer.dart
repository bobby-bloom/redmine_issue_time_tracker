import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ritt/redmine/models/redmine_issue.dart';

part 'timer.freezed.dart';
part 'timer.g.dart';

@freezed
abstract class Timer with _$Timer {
  const factory Timer({
    required String id,
    required Duration totalTime,
    required bool isRunning,
    DateTime? lastStartOn,
    int? issueId,
    RedmineIssue? issue,
  }) = _Timer;

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);
}
