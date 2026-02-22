// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redmine_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(redmineClient)
final redmineClientProvider = RedmineClientProvider._();

final class RedmineClientProvider
    extends $FunctionalProvider<RedmineClient, RedmineClient, RedmineClient>
    with $Provider<RedmineClient> {
  RedmineClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'redmineClientProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[clientProvider, settingsProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          RedmineClientProvider.$allTransitiveDependencies0,
          RedmineClientProvider.$allTransitiveDependencies1,
          RedmineClientProvider.$allTransitiveDependencies2,
        ],
      );

  static final $allTransitiveDependencies0 = clientProvider;
  static final $allTransitiveDependencies1 = settingsProvider;
  static final $allTransitiveDependencies2 =
      SettingsProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$redmineClientHash();

  @$internal
  @override
  $ProviderElement<RedmineClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RedmineClient create(Ref ref) {
    return redmineClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RedmineClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RedmineClient>(value),
    );
  }
}

String _$redmineClientHash() => r'b3764fbd0c7fdd7acd68d10512e9154cf40a9e9d';
