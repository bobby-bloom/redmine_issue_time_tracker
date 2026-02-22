// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pluto_grid_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GridState)
final gridStateProvider = GridStateProvider._();

final class GridStateProvider
    extends $NotifierProvider<GridState, PlutoGridState> {
  GridStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gridStateProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[appStoreProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          GridStateProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = appStoreProvider;

  @override
  String debugGetCreateSourceHash() => _$gridStateHash();

  @$internal
  @override
  GridState create() => GridState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlutoGridState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlutoGridState>(value),
    );
  }
}

String _$gridStateHash() => r'6da4589bdaf56ed818c7909144734da893c8148b';

abstract class _$GridState extends $Notifier<PlutoGridState> {
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
