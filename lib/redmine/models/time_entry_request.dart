class TimeEntryRequest {
  const TimeEntryRequest({
    required this.projectId,
    this.issueId,
    required this.userId,
    this.priorityId,
    required this.activityId,
    this.easyExternalId,
    required this.hours,
    required this.spentOn,
    required this.comments,
    this.easyIsBillable,
    this.easyIsBilled,
    this.customFields,
    this.tagList,
  });

  final int projectId;
  final int? issueId;
  final int userId;
  final int? priorityId;
  final int activityId;
  final String? easyExternalId;
  final String hours;
  final DateTime spentOn;
  final String comments;
  final bool? easyIsBillable;
  final bool? easyIsBilled;
  final List<Map<String, dynamic>>? customFields;
  final List<String>? tagList;

  factory TimeEntryRequest.fromJson(Map<String, dynamic> json) {
    return TimeEntryRequest(
      projectId: json['project_id'],
      issueId: json['issue_id'],
      userId: json['user_id'],
      priorityId: json['priority_id'],
      activityId: json['activity_id'],
      easyExternalId: json['easy_external_id'],
      hours: json['hours'],
      spentOn: DateTime.parse(json['spent_on']),
      comments: json['comments'],
      easyIsBillable: json['easy_is_billable'],
      easyIsBilled: json['easy_is_billed'],
      customFields: json['custom_fields'],
      tagList: json['tag_list'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'project_id': projectId,
      'issue_id': issueId,
      'user_id': userId,
      'priority_id': priorityId,
      'activity_id': activityId,
      'easy_external_id': easyExternalId,
      'hours': hours,
      'spent_on': spentOn.toIso8601String().split('T')[0],
      'comments': comments,
      'easy_is_billable': easyIsBillable,
      'easy_is_billed': easyIsBilled,
      'custom_fields': customFields,
      'tag_list': tagList,
    };
  }
}
