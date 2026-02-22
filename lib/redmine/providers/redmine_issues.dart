import 'dart:async';

import 'package:ritt/redmine/models/redmine_issue.dart';
import 'package:ritt/redmine/models/redmine_issues.dart';
import 'package:ritt/redmine/providers/redmine_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'redmine_issues.g.dart';

@Riverpod(keepAlive: true, dependencies: [redmineService])
class RedmineIssues extends _$RedmineIssues {
  static const fetchLimit = 100;

  @override
  Future<List<RedmineIssuesResponse>> build() async {
    final redmineService = ref.watch(redmineServiceProvider);

    if (redmineService.canMakeRequests) {
      final issues = await redmineService.getIssues(limit: fetchLimit);

      return [issues];
    }
    return [];
  }

  List<RedmineIssue> get() {
    final responses = (state.value ?? []).map((x) => x.issues);

    return responses.expand((x) => x).toList();
  }

  Future<bool> loadNext() async {
    final previous = state.value ?? [];
    final redmineService = ref.read(redmineServiceProvider);

    final lastOffset = state.value?.lastOrNull?.offset ?? 0;
    final offset = lastOffset + fetchLimit;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (!redmineService.canMakeRequests) {
        throw ArgumentError('Unable to make request to redmine');
      }

      final firstResponse = previous.firstOrNull;
      if (firstResponse == null) {
        throw ArgumentError('Could not find first request');
      }

      final alreadyFetched = previous.expand((x) => x.issues).length;
      if (alreadyFetched >= firstResponse.totalCount) {
        throw ArgumentError('Already loaded all available issues');
      }

      final issues = await redmineService.getIssues(
        offset: offset,
        limit: fetchLimit,
      );

      return [...(state.value ?? []), issues];
    });

    return !state.hasError;
  }
}
