import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pluto_grid/pluto_grid.dart'
    show PlutoColumnSort, PlutoColumnFrozen;

part 'pluto_grid_column_state.freezed.dart';
part 'pluto_grid_column_state.g.dart';

@freezed
abstract class PlutoGridColumnState with _$PlutoGridColumnState {
  const factory PlutoGridColumnState({
    required int order,
    required bool visible,
    required double width,
    required PlutoColumnFrozen frozen,
    required PlutoColumnSort sort,
  }) = _PlutoGridColumnState;

  factory PlutoGridColumnState.fromJson(Map<String, dynamic> json) =>
      _$PlutoGridColumnStateFromJson(json);
}
