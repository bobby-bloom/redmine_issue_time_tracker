import 'package:ritt/redmine/models/redmine_thing.dart';
import 'package:ritt/redmine/providers/redmine_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'redmine_time_entry_activities.g.dart';

@Riverpod(keepAlive: true, dependencies: [redmineService])
Future<List<RedmineThing>> timeEntryActitivies(Ref ref, int projectId) async {
  final redmineService = ref.watch(redmineServiceProvider);

  if (redmineService.canMakeRequests) {
    final activities = await redmineService.getTimeEntryActivities(projectId);

    return activities;
  }

  return [];
}
