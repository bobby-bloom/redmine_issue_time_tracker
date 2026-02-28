import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'platform_info.g.dart';

@Riverpod(keepAlive: true)
Future<PackageInfo> platformInfo(Ref ref) async {
  return await PackageInfo.fromPlatform();
}
