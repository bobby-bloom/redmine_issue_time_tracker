// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redmine_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(redmineService)
final redmineServiceProvider = RedmineServiceProvider._();

final class RedmineServiceProvider
    extends $FunctionalProvider<RedmineService, RedmineService, RedmineService>
    with $Provider<RedmineService> {
  RedmineServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'redmineServiceProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[
          redmineClientProvider,
          settingsProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          RedmineServiceProvider.$allTransitiveDependencies0,
          RedmineServiceProvider.$allTransitiveDependencies1,
          RedmineServiceProvider.$allTransitiveDependencies2,
          RedmineServiceProvider.$allTransitiveDependencies3,
        },
      );

  static final $allTransitiveDependencies0 = redmineClientProvider;
  static final $allTransitiveDependencies1 =
      RedmineClientProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      RedmineClientProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 =
      RedmineClientProvider.$allTransitiveDependencies2;

  @override
  String debugGetCreateSourceHash() => _$redmineServiceHash();

  @$internal
  @override
  $ProviderElement<RedmineService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RedmineService create(Ref ref) {
    return redmineService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RedmineService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RedmineService>(value),
    );
  }
}

String _$redmineServiceHash() => r'6652649789cdc7b7a160fb28f902ea532dec1e6d';
