import 'package:ritt/redmine/models/redmine_issue.dart';
import 'package:ritt/redmine/providers/redmine_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'redmine_issue.g.dart';

@Riverpod(keepAlive: true, dependencies: [redmineService])
Future<RedmineIssue?> redmineIssue(Ref ref, int issueId) async {
  final redmineService = ref.watch(redmineServiceProvider);

  if (redmineService.canMakeRequests) {
    final issue = await redmineService.getIssue(issueId);

    return issue;
  }

  return null;
}
