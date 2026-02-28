// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pluto_grid_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GridStateController)
final gridStateControllerProvider = GridStateControllerProvider._();

final class GridStateControllerProvider
    extends $NotifierProvider<GridStateController, PlutoGridState> {
  GridStateControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gridStateControllerProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[appStoreProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          GridStateControllerProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = appStoreProvider;

  @override
  String debugGetCreateSourceHash() => _$gridStateControllerHash();

  @$internal
  @override
  GridStateController create() => GridStateController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlutoGridState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlutoGridState>(value),
    );
  }
}

String _$gridStateControllerHash() =>
    r'319658595317704336ccdee31ffc4eccb204d4fc';

abstract class _$GridStateController extends $Notifier<PlutoGridState> {
  PlutoGridState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PlutoGridState, PlutoGridState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PlutoGridState, PlutoGridState>,
              PlutoGridState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
