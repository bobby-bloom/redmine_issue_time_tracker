import 'package:ritt/redmine/models/redmine_thing.dart';

class RedmineIssue {
  const RedmineIssue({
    required this.id,
    required this.project,
    this.feature,
    required this.status,
    this.tracker,
    this.priority,
    this.assignedTo,
    this.author,
    this.category,
    required this.subject,
    this.description,
    this.startDate,
    this.dueDate,
    this.estimatedHours,
    required this.createdOn,
    this.updatedOn,
    this.closedOn,
    required this.fetchedOn,
  });

  final int id;
  final RedmineThing project;
  final RedmineThing? feature;
  final RedmineThing status;
  final RedmineThing? tracker;
  final RedmineThing? priority;
  final RedmineThing? assignedTo;
  final RedmineThing? author;
  final RedmineThing? category;
  final String subject;
  final String? description;
  final DateTime? startDate;
  final DateTime? dueDate;
  final double? estimatedHours;
  final DateTime createdOn;
  final DateTime? updatedOn;
  final DateTime? closedOn;
  final DateTime fetchedOn;

  factory RedmineIssue.fromJson(Map<String, dynamic> json) {
    return RedmineIssue(
      id: json['id'],
      project: RedmineThing.fromJson(json['project']),
      feature: json['feature'] == null
          ? null
          : RedmineThing.fromJson(json['feature']),
      status: RedmineThing.fromJson(json['status']),
      tracker: json['tracker'] == null
          ? null
          : RedmineThing.fromJson(json['tracker']),
      priority: json['priority'] == null
          ? null
          : RedmineThing.fromJson(json['priority']),
      assignedTo: json['assigned_to'] == null
          ? null
          : RedmineThing.fromJson(json['assigned_to']),
      author: json['author'] == null
          ? null
          : RedmineThing.fromJson(json['author']),
      category: json['category'] == null
          ? null
          : RedmineThing.fromJson(json['category']),
      subject: json['subject'],
      description: json['description'],
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date']),
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date']),
      estimatedHours: json['estimatedHours'] == null
          ? null
          : double.parse(json['estimatedHours']),
      createdOn: DateTime.parse(json['created_on']),
      updatedOn: json['updated_on'] == null
          ? null
          : DateTime.parse(json['updated_on']),
      fetchedOn: json['_fetchedOn'] == null
          ? DateTime.now()
          : DateTime.parse(json['_fetchedOn']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {
      'id': id,
      'project': project.toJson(),
      'feature': feature?.toJson(),
      'status': status.toJson(),
      'tracker': tracker?.toJson(),
      'priority': priority?.toJson(),
      'assigned_to': assignedTo?.toJson(),
      'author': author?.toJson(),
      'category': category?.toJson(),
      'subject': subject,
      'description': description,
      'start_date': startDate?.toIso8601String(),
      'due_date': dueDate?.toIso8601String(),
      'estimated_hours': estimatedHours?.toString(),
      'created_on': createdOn.toIso8601String(),
      'updated_on': updatedOn?.toIso8601String(),
      'closed_on': closedOn?.toIso8601String(),
      '_fetchedOn': fetchedOn.toIso8601String(),
    };

    return map;
  }
}
