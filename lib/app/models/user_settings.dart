import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ritt/redmine/models/redmine_issue_status.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

@freezed
abstract class UserSettings with _$UserSettings {
  const factory UserSettings({
    String? redmineApiKey,
    String? redmineHost,
    @Default(false) bool runMultipleTimersSimultaneously,
    @Default(true) bool fetchOnlyIssuesAssignedToMe,
    @Default(15) int roundTimeEntryUpToMinute,
    @Default([]) List<String> billableTrackers,
    @Default(RedmineIssueStatus.open) RedmineIssueStatus fetchIssuesStatus,
    @Default(false) bool deleteTimerAfterTimeEntryPosted,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}
