import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ritt/pluto_grid/models/pluto_grid_column_state.dart';

part 'pluto_grid_state.freezed.dart';
part 'pluto_grid_state.g.dart';

@freezed
abstract class PlutoGridState with _$PlutoGridState {
  const factory PlutoGridState({
    required Map<String, bool> expandedRowGroups,
    @Default({}) Map<String, PlutoGridColumnState> columnState,
  }) = _PlutoGridState;

  factory PlutoGridState.fromJson(Map<String, dynamic> json) =>
      _$PlutoGridStateFromJson(json);
}
