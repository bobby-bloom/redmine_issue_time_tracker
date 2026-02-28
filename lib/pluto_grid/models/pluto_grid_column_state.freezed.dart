// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pluto_grid_column_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlutoGridColumnState {

 int get order; bool get visible; double get width; PlutoColumnFrozen get frozen; PlutoColumnSort get sort;
/// Create a copy of PlutoGridColumnState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlutoGridColumnStateCopyWith<PlutoGridColumnState> get copyWith => _$PlutoGridColumnStateCopyWithImpl<PlutoGridColumnState>(this as PlutoGridColumnState, _$identity);

  /// Serializes this PlutoGridColumnState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlutoGridColumnState&&(identical(other.order, order) || other.order == order)&&(identical(other.visible, visible) || other.visible == visible)&&(identical(other.width, width) || other.width == width)&&(identical(other.frozen, frozen) || other.frozen == frozen)&&(identical(other.sort, sort) || other.sort == sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,order,visible,width,frozen,sort);

@override
String toString() {
  return 'PlutoGridColumnState(order: $order, visible: $visible, width: $width, frozen: $frozen, sort: $sort)';
}


}

/// @nodoc
abstract mixin class $PlutoGridColumnStateCopyWith<$Res>  {
  factory $PlutoGridColumnStateCopyWith(PlutoGridColumnState value, $Res Function(PlutoGridColumnState) _then) = _$PlutoGridColumnStateCopyWithImpl;
@useResult
$Res call({
 int order, bool visible, double width, PlutoColumnFrozen frozen, PlutoColumnSort sort
});




}
/// @nodoc
class _$PlutoGridColumnStateCopyWithImpl<$Res>
    implements $PlutoGridColumnStateCopyWith<$Res> {
  _$PlutoGridColumnStateCopyWithImpl(this._self, this._then);

  final PlutoGridColumnState _self;
  final $Res Function(PlutoGridColumnState) _then;

/// Create a copy of PlutoGridColumnState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = null,Object? visible = null,Object? width = null,Object? frozen = null,Object? sort = null,}) {
  return _then(_self.copyWith(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,frozen: null == frozen ? _self.frozen : frozen // ignore: cast_nullable_to_non_nullable
as PlutoColumnFrozen,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as PlutoColumnSort,
  ));
}

}


/// Adds pattern-matching-related methods to [PlutoGridColumnState].
extension PlutoGridColumnStatePatterns on PlutoGridColumnState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlutoGridColumnState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlutoGridColumnState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlutoGridColumnState value)  $default,){
final _that = this;
switch (_that) {
case _PlutoGridColumnState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlutoGridColumnState value)?  $default,){
final _that = this;
switch (_that) {
case _PlutoGridColumnState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int order,  bool visible,  double width,  PlutoColumnFrozen frozen,  PlutoColumnSort sort)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlutoGridColumnState() when $default != null:
return $default(_that.order,_that.visible,_that.width,_that.frozen,_that.sort);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int order,  bool visible,  double width,  PlutoColumnFrozen frozen,  PlutoColumnSort sort)  $default,) {final _that = this;
switch (_that) {
case _PlutoGridColumnState():
return $default(_that.order,_that.visible,_that.width,_that.frozen,_that.sort);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int order,  bool visible,  double width,  PlutoColumnFrozen frozen,  PlutoColumnSort sort)?  $default,) {final _that = this;
switch (_that) {
case _PlutoGridColumnState() when $default != null:
return $default(_that.order,_that.visible,_that.width,_that.frozen,_that.sort);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlutoGridColumnState implements PlutoGridColumnState {
  const _PlutoGridColumnState({required this.order, required this.visible, required this.width, required this.frozen, required this.sort});
  factory _PlutoGridColumnState.fromJson(Map<String, dynamic> json) => _$PlutoGridColumnStateFromJson(json);

@override final  int order;
@override final  bool visible;
@override final  double width;
@override final  PlutoColumnFrozen frozen;
@override final  PlutoColumnSort sort;

/// Create a copy of PlutoGridColumnState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlutoGridColumnStateCopyWith<_PlutoGridColumnState> get copyWith => __$PlutoGridColumnStateCopyWithImpl<_PlutoGridColumnState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlutoGridColumnStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlutoGridColumnState&&(identical(other.order, order) || other.order == order)&&(identical(other.visible, visible) || other.visible == visible)&&(identical(other.width, width) || other.width == width)&&(identical(other.frozen, frozen) || other.frozen == frozen)&&(identical(other.sort, sort) || other.sort == sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,order,visible,width,frozen,sort);

@override
String toString() {
  return 'PlutoGridColumnState(order: $order, visible: $visible, width: $width, frozen: $frozen, sort: $sort)';
}


}

/// @nodoc
abstract mixin class _$PlutoGridColumnStateCopyWith<$Res> implements $PlutoGridColumnStateCopyWith<$Res> {
  factory _$PlutoGridColumnStateCopyWith(_PlutoGridColumnState value, $Res Function(_PlutoGridColumnState) _then) = __$PlutoGridColumnStateCopyWithImpl;
@override @useResult
$Res call({
 int order, bool visible, double width, PlutoColumnFrozen frozen, PlutoColumnSort sort
});




}
/// @nodoc
class __$PlutoGridColumnStateCopyWithImpl<$Res>
    implements _$PlutoGridColumnStateCopyWith<$Res> {
  __$PlutoGridColumnStateCopyWithImpl(this._self, this._then);

  final _PlutoGridColumnState _self;
  final $Res Function(_PlutoGridColumnState) _then;

/// Create a copy of PlutoGridColumnState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = null,Object? visible = null,Object? width = null,Object? frozen = null,Object? sort = null,}) {
  return _then(_PlutoGridColumnState(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,frozen: null == frozen ? _self.frozen : frozen // ignore: cast_nullable_to_non_nullable
as PlutoColumnFrozen,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as PlutoColumnSort,
  ));
}


}

// dart format on
