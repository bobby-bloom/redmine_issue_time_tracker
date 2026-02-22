// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pluto_grid_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlutoGridState _$PlutoGridStateFromJson(Map<String, dynamic> json) =>
    _PlutoGridState(
      expandedRowGroups: Map<String, bool>.from(
        json['expandedRowGroups'] as Map,
      ),
      columnState:
          (json['columnState'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              k,
              PlutoGridColumnState.fromJson(e as Map<String, dynamic>),
            ),
          ) ??
          const {},
    );

Map<String, dynamic> _$PlutoGridStateToJson(_PlutoGridState instance) =>
    <String, dynamic>{
      'expandedRowGroups': instance.expandedRowGroups,
      'columnState': instance.columnState,
    };
