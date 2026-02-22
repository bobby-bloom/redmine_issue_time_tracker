// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pluto_grid_column_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlutoGridColumnState _$PlutoGridColumnStateFromJson(
  Map<String, dynamic> json,
) => _PlutoGridColumnState(
  order: (json['order'] as num).toInt(),
  visible: json['visible'] as bool,
  width: (json['width'] as num).toDouble(),
  frozen: $enumDecode(_$PlutoColumnFrozenEnumMap, json['frozen']),
  sort: $enumDecode(_$PlutoColumnSortEnumMap, json['sort']),
);

Map<String, dynamic> _$PlutoGridColumnStateToJson(
  _PlutoGridColumnState instance,
) => <String, dynamic>{
  'order': instance.order,
  'visible': instance.visible,
  'width': instance.width,
  'frozen': _$PlutoColumnFrozenEnumMap[instance.frozen]!,
  'sort': _$PlutoColumnSortEnumMap[instance.sort]!,
};

const _$PlutoColumnFrozenEnumMap = {
  PlutoColumnFrozen.none: 'none',
  PlutoColumnFrozen.start: 'start',
  PlutoColumnFrozen.end: 'end',
};

const _$PlutoColumnSortEnumMap = {
  PlutoColumnSort.none: 'none',
  PlutoColumnSort.ascending: 'ascending',
  PlutoColumnSort.descending: 'descending',
};
