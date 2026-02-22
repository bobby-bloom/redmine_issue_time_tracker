// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redmine_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(redmineUser)
final redmineUserProvider = RedmineUserProvider._();

final class RedmineUserProvider
    extends
        $FunctionalProvider<
          AsyncValue<RedmineUser?>,
          RedmineUser?,
          FutureOr<RedmineUser?>
        >
    with $FutureModifier<RedmineUser?>, $FutureProvider<RedmineUser?> {
  RedmineUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'redmineUserProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[redmineServiceProvider],
        $allTransitiveDependencies: <ProviderOrFamily>{
          RedmineUserProvider.$allTransitiveDependencies0,
          RedmineUserProvider.$allTransitiveDependencies1,
          RedmineUserProvider.$allTransitiveDependencies2,
          RedmineUserProvider.$allTransitiveDependencies3,
          RedmineUserProvider.$allTransitiveDependencies4,
        },
      );

  static final $allTransitiveDependencies0 = redmineServiceProvider;
  static final $allTransitiveDependencies1 =
      RedmineServiceProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      RedmineServiceProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 =
      RedmineServiceProvider.$allTransitiveDependencies2;
  static final $allTransitiveDependencies4 =
      RedmineServiceProvider.$allTransitiveDependencies3;

  @override
  String debugGetCreateSourceHash() => _$redmineUserHash();

  @$internal
  @override
  $FutureProviderElement<RedmineUser?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RedmineUser?> create(Ref ref) {
    return redmineUser(ref);
  }
}

String _$redmineUserHash() => r'882beb2e51f0ecc283c18da6c294e39b6a8f4aa0';
