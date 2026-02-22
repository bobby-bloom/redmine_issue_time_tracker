import 'dart:convert';

import 'package:ritt/redmine/models/redmine_issue.dart';

class RedmineIssuesResponse {
  const RedmineIssuesResponse({
    required this.issues,
    required this.totalCount,
    required this.offset,
  });

  final List<RedmineIssue> issues;
  final int totalCount;
  final int offset;

  factory RedmineIssuesResponse.fromJson(Map<String, dynamic> json) {
    return RedmineIssuesResponse(
      issues: (json['issues'] as List)
          .map((x) => RedmineIssue.fromJson(x))
          .toList(),
      totalCount: json['total_count'],
      offset: json['offset'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {
      'issues': jsonEncode(issues.map((x) => x.toJson()).toList()),
      'total_count': totalCount,
      'offset': offset,
    };

    return map;
  }
}
