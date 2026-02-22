import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:ritt/redmine/models/redmine_issue.dart';
import 'package:ritt/redmine/models/redmine_issue_status.dart';
import 'package:ritt/redmine/models/redmine_issues.dart';
import 'package:ritt/redmine/models/redmine_thing.dart';
import 'package:ritt/redmine/models/time_entry.dart';
import 'package:ritt/redmine/models/time_entry_request.dart';
import 'package:ritt/redmine/models/redmine_user.dart';
import 'package:ritt/redmine/providers/redmine_client.dart';
import 'package:ritt/app/providers/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'redmine_service.g.dart';

class RedmineService {
  const RedmineService(
    this.client,
    this.authority,
    this.fetchOnlyIssuesAssignedToMe,
    this.fetchIssuesStatus,
  );

  final RedmineClient client;

  final String? authority;

  final bool fetchOnlyIssuesAssignedToMe;

  final RedmineIssueStatus fetchIssuesStatus;

  static const format = 'json';
  static const currentUserPath = '/users/current.$format';
  static const projectsPath = '/projects.$format';
  static const issuesPath = '/issues.$format';
  static const timeEntriesPath = '/time_entries.$format';

  bool get canMakeRequests =>
      client.apiKey != null && client.apiKey!.isNotEmpty && authority != null;

  Future<RedmineUser> getMe() async {
    final response = await client.get(Uri.https(authority!, currentUserPath));

    handleErrorResponse('user', response);

    final decoded = jsonDecode(response.body);
    final user = RedmineUser.fromJson(decoded['user']);

    return user;
  }

  Future<RedmineIssue?> getIssue(int issueId) async {
    final queryParams = {'set_filter': '1', 'issue_id': issueId.toString()};

    final uri = Uri.https(authority!, issuesPath, queryParams);
    final response = await client.get(uri);

    handleErrorResponse('issue', response);

    final decoded = jsonDecode(response.body);
    final issue = (decoded['issues'] as List)
        .map((x) => RedmineIssue.fromJson(x))
        .toList()
        .firstOrNull;

    return issue;
  }

  Future<RedmineIssuesResponse> getIssues({
    int limit = 100,
    int offset = 0,
  }) async {
    final queryParams = {
      'set_filter': '1',
      'limit': limit.toString(),
      'offset': offset.toString(),
      'status_id': fetchIssuesStatus == .all ? '*' : fetchIssuesStatus.name,
    };

    if (fetchOnlyIssuesAssignedToMe) {
      queryParams['assigned_to_id'] = 'me';
    }

    final uri = Uri.https(authority!, issuesPath, queryParams);
    final response = await client.get(uri);

    handleErrorResponse('issues', response);

    final raw = jsonDecode(response.body);
    final issues = RedmineIssuesResponse.fromJson(raw);

    return issues;
  }

  Future<List<RedmineThing>> getTimeEntryActivities(int projectId) async {
    final queryParams = {
      'set_filter': '1',
      'include': 'time_entry_activities',
      'project_id': projectId.toString(),
    };
    final uri = Uri.https(authority!, projectsPath, queryParams);
    final response = await client.get(uri);

    handleErrorResponse('time_entry_activities', response);

    final decoded = jsonDecode(response.body);
    final project = (decoded['projects'] as List).firstOrNull;

    if (project == null) {
      throw StateError('Could not retrieve time entry activities: No project.');
    }

    final activities = (project['time_entry_activities'] as List)
        .map((x) => RedmineThing.fromJson(x))
        .toList();

    return activities;
  }

  Future<TimeEntryResponse> postTimeEntry({
    required int userId,
    required int projectId,
    int? issueId,
    required int activityId,
    required String comments,
    required Duration hours,
    required DateTime spentOn,
    bool? easyIsBillable,
  }) async {
    final requestBody = TimeEntryRequest(
      projectId: projectId,
      issueId: issueId,
      activityId: activityId,
      userId: userId,
      comments: comments,
      hours: '${hours.inHours}h${hours.inMinutes % 60}m',
      spentOn: spentOn,
      easyIsBillable: easyIsBillable,
    ).toJson()..removeWhere((_, v) => v == null);

    final uri = Uri.https(authority!, timeEntriesPath);
    final response = await client.post(
      uri,
      body: jsonEncode({'time_entry': requestBody}),
    );

    handleErrorResponse('time_entry', response);

    final decoded = jsonDecode(response.body);
    final timeEntry = TimeEntryResponse.fromJson(decoded['time_entry']);

    return timeEntry;
  }

  void handleErrorResponse(String resource, Response response) {
    if (response.statusCode < 400) {
      return;
    }

    String msg = 'Unable to complete request for resource "$resource". Reason:';

    if (response.statusCode == 401) {
      throw ClientException("$msg Unauthorized.");
    }

    final decoded = jsonDecode(response.body);
    final errorsObj = decoded['errors'];

    List<String> errors = [];
    if (errorsObj != null) {
      errors = (errorsObj as List).map((x) => x.toString()).toList();
    }

    if (errors.isEmpty) {
      msg = '$msg Unknown';
    }

    for (final e in errors) {
      if (errors.indexOf(e) == 0) {
        msg = '$msg $e';
        continue;
      }
      msg = '$msg \n$e';
    }

    throw ClientException(msg);
  }
}

@Riverpod(dependencies: [redmineClient, Settings])
RedmineService redmineService(Ref ref) {
  final (
    redmineHost,
    fetchOnlyIssuesAssignedToMe,
    fetchIssuesStatus,
  ) = ref.watch(
    settingsProvider.select(
      (x) =>
          (x.redmineHost, x.fetchOnlyIssuesAssignedToMe, x.fetchIssuesStatus),
    ),
  );
  final client = ref.watch(redmineClientProvider);

  return RedmineService(
    client,
    redmineHost,
    fetchOnlyIssuesAssignedToMe,
    fetchIssuesStatus,
  );
}
