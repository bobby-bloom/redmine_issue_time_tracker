import 'package:ritt/redmine/models/redmine_user.dart';
import 'package:ritt/redmine/providers/redmine_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'redmine_user.g.dart';

@Riverpod(keepAlive: true, dependencies: [redmineService])
Future<RedmineUser?> redmineUser(Ref ref) async {
  final redmineService = ref.watch(redmineServiceProvider);

  if (redmineService.canMakeRequests) {
    final user = await redmineService.getMe();

    return user;
  }

  return null;
}
