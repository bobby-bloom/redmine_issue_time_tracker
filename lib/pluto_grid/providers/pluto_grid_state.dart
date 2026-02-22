import 'package:collection/collection.dart';
import 'package:ritt/pluto_grid/models/pluto_grid_column_state.dart';
import 'package:ritt/pluto_grid/models/pluto_grid_state.dart';
import 'package:ritt/app/providers/app_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pluto_grid_state.g.dart';

final storeKey = AppKeys.plutoGridState;

@Riverpod(keepAlive: true, dependencies: [appStore])
class GridState extends _$GridState {
  @override
  PlutoGridState build() {
    final appStore = ref.watch(appStoreProvider);

    return appStore.read(storeKey) ??
        PlutoGridState(expandedRowGroups: {}, columnState: {});
  }

  void setRowGroupExpandend(Map<String, bool> newState) {
    if (DeepCollectionEquality().equals(state.expandedRowGroups, newState)) {
      return;
    }

    state = state.copyWith(expandedRowGroups: newState);
    _writeState();
  }

  void setColumnState(String key, PlutoGridColumnState newState) {
    final columnState = state.columnState;

    columnState[key] = newState;
    state = state.copyWith(columnState: columnState);

    _writeState();
  }

  void setColumnsState(Map<String, PlutoGridColumnState> newState) {
    final merged = {...state.columnState, ...newState};

    if (const DeepCollectionEquality().equals(state.columnState, merged)) {
      return;
    }

    state = state.copyWith(columnState: merged);
    _writeState();
  }

  void resetState() {
    if (state.columnState.isNotEmpty) {
      state = state.copyWith(columnState: {});
    }

    if (state.expandedRowGroups.isNotEmpty) {
      state = state.copyWith(expandedRowGroups: {});
    }

    _writeState();
  }

  void _writeState() {
    ref.read(appStoreProvider).write(storeKey, state);
  }
}
