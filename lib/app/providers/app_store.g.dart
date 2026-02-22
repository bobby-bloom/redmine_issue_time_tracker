// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appStore)
final appStoreProvider = AppStoreProvider._();

final class AppStoreProvider
    extends $FunctionalProvider<AppStore, AppStore, AppStore>
    with $Provider<AppStore> {
  AppStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appStoreProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$appStoreHash();

  @$internal
  @override
  $ProviderElement<AppStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppStore create(Ref ref) {
    return appStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppStore>(value),
    );
  }
}

String _$appStoreHash() => r'c25f55b5123a7814eac3aa56c014b9395f056f32';
