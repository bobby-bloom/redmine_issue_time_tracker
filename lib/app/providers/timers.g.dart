// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Timers)
final timersProvider = TimersProvider._();

final class TimersProvider extends $NotifierProvider<Timers, List<Timer>> {
  TimersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timersProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[
          appStoreProvider,
          settingsProvider,
          redmineIssueProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          TimersProvider.$allTransitiveDependencies0,
          TimersProvider.$allTransitiveDependencies1,
          TimersProvider.$allTransitiveDependencies2,
          TimersProvider.$allTransitiveDependencies3,
          TimersProvider.$allTransitiveDependencies4,
          TimersProvider.$allTransitiveDependencies5,
        },
      );

  static final $allTransitiveDependencies0 = appStoreProvider;
  static final $allTransitiveDependencies1 = settingsProvider;
  static final $allTransitiveDependencies2 = redmineIssueProvider;
  static final $allTransitiveDependencies3 =
      RedmineIssueProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies4 =
      RedmineIssueProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies5 =
      RedmineIssueProvider.$allTransitiveDependencies2;

  @override
  String debugGetCreateSourceHash() => _$timersHash();

  @$internal
  @override
  Timers create() => Timers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Timer> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Timer>>(value),
    );
  }
}

String _$timersHash() => r'7ba7a362006df1c04358cc8a69c034ab523a5f2f';

abstract class _$Timers extends $Notifier<List<Timer>> {
  List<Timer> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Timer>, List<Timer>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Timer>, List<Timer>>,
              List<Timer>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
