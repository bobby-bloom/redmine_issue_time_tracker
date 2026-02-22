import 'dart:convert';

import 'package:ritt/redmine/models/redmine_thing.dart';

class TimeEntryResponse {
  const TimeEntryResponse({
    required this.id,
    required this.project,
    this.issue,
    required this.user,
    this.priority,
    this.activity,
    required this.hours,
    required this.spentOn,
    required this.comments,
    this.easyIsBillable,
    this.easyIsBilled,
    this.customFields,
  });

  final int id;
  final RedmineThing project;
  final RedmineThing? issue;
  final RedmineThing user;
  final RedmineThing? priority;
  final RedmineThing? activity;
  final double hours;
  final DateTime spentOn;
  final String comments;
  final bool? easyIsBillable;
  final bool? easyIsBilled;
  final List<dynamic>? customFields;

  factory TimeEntryResponse.fromJson(Map<String, dynamic> json) {
    return TimeEntryResponse(
      id: json['id'],
      project: RedmineThing.fromJson(json['project']),
      issue: RedmineThing.fromJson(json['issue']),
      user: RedmineThing.fromJson(json['user']),
      priority: json['priority'] == null
          ? null
          : RedmineThing.fromJson(json['priority']),
      activity: RedmineThing.fromJson(json['activity']),
      hours: json['hours'],
      spentOn: DateTime.parse(json['spent_on']),
      comments: json['comments'],
      easyIsBillable: json['easy_is_billable'],
      easyIsBilled: json['easy_is_billed'],
      customFields: json['custom_fields'],
    );
  }

  String toJson() {
    final map = <String, dynamic>{
      'id': id,
      'project': project.toJson(),
      'issue': issue?.toJson(),
      'user': user.toJson(),
      'priority': priority?.toJson(),
      'activity': activity?.toJson(),
      'hours': hours,
      'spent_on': spentOn,
      'comments': comments,
      'easy_is_billable': easyIsBillable,
      'easy_is_billed': easyIsBilled,
      'custom_fields': customFields,
    };

    return jsonEncode(map);
  }
}
