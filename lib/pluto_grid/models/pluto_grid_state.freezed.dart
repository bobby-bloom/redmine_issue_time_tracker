// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pluto_grid_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlutoGridState {

 Map<String, bool> get expandedRowGroups; Map<String, PlutoGridColumnState> get columnState;
/// Create a copy of PlutoGridState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlutoGridStateCopyWith<PlutoGridState> get copyWith => _$PlutoGridStateCopyWithImpl<PlutoGridState>(this as PlutoGridState, _$identity);

  /// Serializes this PlutoGridState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlutoGridState&&const DeepCollectionEquality().equals(other.expandedRowGroups, expandedRowGroups)&&const DeepCollectionEquality().equals(other.columnState, columnState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(expandedRowGroups),const DeepCollectionEquality().hash(columnState));

@override
String toString() {
  return 'PlutoGridState(expandedRowGroups: $expandedRowGroups, columnState: $columnState)';
}


}

/// @nodoc
abstract mixin class $PlutoGridStateCopyWith<$Res>  {
  factory $PlutoGridStateCopyWith(PlutoGridState value, $Res Function(PlutoGridState) _then) = _$PlutoGridStateCopyWithImpl;
@useResult
$Res call({
 Map<String, bool> expandedRowGroups, Map<String, PlutoGridColumnState> columnState
});




}
/// @nodoc
class _$PlutoGridStateCopyWithImpl<$Res>
    implements $PlutoGridStateCopyWith<$Res> {
  _$PlutoGridStateCopyWithImpl(this._self, this._then);

  final PlutoGridState _self;
  final $Res Function(PlutoGridState) _then;

/// Create a copy of PlutoGridState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? expandedRowGroups = null,Object? columnState = null,}) {
  return _then(_self.copyWith(
expandedRowGroups: null == expandedRowGroups ? _self.expandedRowGroups : expandedRowGroups // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,columnState: null == columnState ? _self.columnState : columnState // ignore: cast_nullable_to_non_nullable
as Map<String, PlutoGridColumnState>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlutoGridState].
extension PlutoGridStatePatterns on PlutoGridState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlutoGridState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlutoGridState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlutoGridState value)  $default,){
final _that = this;
switch (_that) {
case _PlutoGridState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlutoGridState value)?  $default,){
final _that = this;
switch (_that) {
case _PlutoGridState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, bool> expandedRowGroups,  Map<String, PlutoGridColumnState> columnState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlutoGridState() when $default != null:
return $default(_that.expandedRowGroups,_that.columnState);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, bool> expandedRowGroups,  Map<String, PlutoGridColumnState> columnState)  $default,) {final _that = this;
switch (_that) {
case _PlutoGridState():
return $default(_that.expandedRowGroups,_that.columnState);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, bool> expandedRowGroups,  Map<String, PlutoGridColumnState> columnState)?  $default,) {final _that = this;
switch (_that) {
case _PlutoGridState() when $default != null:
return $default(_that.expandedRowGroups,_that.columnState);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlutoGridState implements PlutoGridState {
  const _PlutoGridState({required final  Map<String, bool> expandedRowGroups, final  Map<String, PlutoGridColumnState> columnState = const {}}): _expandedRowGroups = expandedRowGroups,_columnState = columnState;
  factory _PlutoGridState.fromJson(Map<String, dynamic> json) => _$PlutoGridStateFromJson(json);

 final  Map<String, bool> _expandedRowGroups;
@override Map<String, bool> get expandedRowGroups {
  if (_expandedRowGroups is EqualUnmodifiableMapView) return _expandedRowGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_expandedRowGroups);
}

 final  Map<String, PlutoGridColumnState> _columnState;
@override@JsonKey() Map<String, PlutoGridColumnState> get columnState {
  if (_columnState is EqualUnmodifiableMapView) return _columnState;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_columnState);
}


/// Create a copy of PlutoGridState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlutoGridStateCopyWith<_PlutoGridState> get copyWith => __$PlutoGridStateCopyWithImpl<_PlutoGridState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlutoGridStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlutoGridState&&const DeepCollectionEquality().equals(other._expandedRowGroups, _expandedRowGroups)&&const DeepCollectionEquality().equals(other._columnState, _columnState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_expandedRowGroups),const DeepCollectionEquality().hash(_columnState));

@override
String toString() {
  return 'PlutoGridState(expandedRowGroups: $expandedRowGroups, columnState: $columnState)';
}


}

/// @nodoc
abstract mixin class _$PlutoGridStateCopyWith<$Res> implements $PlutoGridStateCopyWith<$Res> {
  factory _$PlutoGridStateCopyWith(_PlutoGridState value, $Res Function(_PlutoGridState) _then) = __$PlutoGridStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, bool> expandedRowGroups, Map<String, PlutoGridColumnState> columnState
});




}
/// @nodoc
class __$PlutoGridStateCopyWithImpl<$Res>
    implements _$PlutoGridStateCopyWith<$Res> {
  __$PlutoGridStateCopyWithImpl(this._self, this._then);

  final _PlutoGridState _self;
  final $Res Function(_PlutoGridState) _then;

/// Create a copy of PlutoGridState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expandedRowGroups = null,Object? columnState = null,}) {
  return _then(_PlutoGridState(
expandedRowGroups: null == expandedRowGroups ? _self._expandedRowGroups : expandedRowGroups // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,columnState: null == columnState ? _self._columnState : columnState // ignore: cast_nullable_to_non_nullable
as Map<String, PlutoGridColumnState>,
  ));
}


}

// dart format on
