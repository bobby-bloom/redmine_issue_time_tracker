// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_info.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(platformInfo)
final platformInfoProvider = PlatformInfoProvider._();

final class PlatformInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<PackageInfo>,
          PackageInfo,
          FutureOr<PackageInfo>
        >
    with $FutureModifier<PackageInfo>, $FutureProvider<PackageInfo> {
  PlatformInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'platformInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$platformInfoHash();

  @$internal
  @override
  $FutureProviderElement<PackageInfo> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PackageInfo> create(Ref ref) {
    return platformInfo(ref);
  }
}

String _$platformInfoHash() => r'4554ce66eb441868b3cda07d88e96cb3de5636cb';
