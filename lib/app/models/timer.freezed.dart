// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Timer {

 String get id; Duration get totalTime; bool get isRunning; DateTime? get lastStartOn; int? get issueId; RedmineIssue? get issue;// Can be set when there is currently no issue
 String? get subject;
/// Create a copy of Timer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerCopyWith<Timer> get copyWith => _$TimerCopyWithImpl<Timer>(this as Timer, _$identity);

  /// Serializes this Timer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Timer&&(identical(other.id, id) || other.id == id)&&(identical(other.totalTime, totalTime) || other.totalTime == totalTime)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.lastStartOn, lastStartOn) || other.lastStartOn == lastStartOn)&&(identical(other.issueId, issueId) || other.issueId == issueId)&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.subject, subject) || other.subject == subject));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,totalTime,isRunning,lastStartOn,issueId,issue,subject);

@override
String toString() {
  return 'Timer(id: $id, totalTime: $totalTime, isRunning: $isRunning, lastStartOn: $lastStartOn, issueId: $issueId, issue: $issue, subject: $subject)';
}


}

/// @nodoc
abstract mixin class $TimerCopyWith<$Res>  {
  factory $TimerCopyWith(Timer value, $Res Function(Timer) _then) = _$TimerCopyWithImpl;
@useResult
$Res call({
 String id, Duration totalTime, bool isRunning, DateTime? lastStartOn, int? issueId, RedmineIssue? issue, String? subject
});




}
/// @nodoc
class _$TimerCopyWithImpl<$Res>
    implements $TimerCopyWith<$Res> {
  _$TimerCopyWithImpl(this._self, this._then);

  final Timer _self;
  final $Res Function(Timer) _then;

/// Create a copy of Timer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? totalTime = null,Object? isRunning = null,Object? lastStartOn = freezed,Object? issueId = freezed,Object? issue = freezed,Object? subject = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,totalTime: null == totalTime ? _self.totalTime : totalTime // ignore: cast_nullable_to_non_nullable
as Duration,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,lastStartOn: freezed == lastStartOn ? _self.lastStartOn : lastStartOn // ignore: cast_nullable_to_non_nullable
as DateTime?,issueId: freezed == issueId ? _self.issueId : issueId // ignore: cast_nullable_to_non_nullable
as int?,issue: freezed == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as RedmineIssue?,subject: freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Timer].
extension TimerPatterns on Timer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Timer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Timer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Timer value)  $default,){
final _that = this;
switch (_that) {
case _Timer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Timer value)?  $default,){
final _that = this;
switch (_that) {
case _Timer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Duration totalTime,  bool isRunning,  DateTime? lastStartOn,  int? issueId,  RedmineIssue? issue,  String? subject)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Timer() when $default != null:
return $default(_that.id,_that.totalTime,_that.isRunning,_that.lastStartOn,_that.issueId,_that.issue,_that.subject);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Duration totalTime,  bool isRunning,  DateTime? lastStartOn,  int? issueId,  RedmineIssue? issue,  String? subject)  $default,) {final _that = this;
switch (_that) {
case _Timer():
return $default(_that.id,_that.totalTime,_that.isRunning,_that.lastStartOn,_that.issueId,_that.issue,_that.subject);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Duration totalTime,  bool isRunning,  DateTime? lastStartOn,  int? issueId,  RedmineIssue? issue,  String? subject)?  $default,) {final _that = this;
switch (_that) {
case _Timer() when $default != null:
return $default(_that.id,_that.totalTime,_that.isRunning,_that.lastStartOn,_that.issueId,_that.issue,_that.subject);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Timer implements Timer {
  const _Timer({required this.id, required this.totalTime, required this.isRunning, this.lastStartOn, this.issueId, this.issue, this.subject});
  factory _Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);

@override final  String id;
@override final  Duration totalTime;
@override final  bool isRunning;
@override final  DateTime? lastStartOn;
@override final  int? issueId;
@override final  RedmineIssue? issue;
// Can be set when there is currently no issue
@override final  String? subject;

/// Create a copy of Timer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerCopyWith<_Timer> get copyWith => __$TimerCopyWithImpl<_Timer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Timer&&(identical(other.id, id) || other.id == id)&&(identical(other.totalTime, totalTime) || other.totalTime == totalTime)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.lastStartOn, lastStartOn) || other.lastStartOn == lastStartOn)&&(identical(other.issueId, issueId) || other.issueId == issueId)&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.subject, subject) || other.subject == subject));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,totalTime,isRunning,lastStartOn,issueId,issue,subject);

@override
String toString() {
  return 'Timer(id: $id, totalTime: $totalTime, isRunning: $isRunning, lastStartOn: $lastStartOn, issueId: $issueId, issue: $issue, subject: $subject)';
}


}

/// @nodoc
abstract mixin class _$TimerCopyWith<$Res> implements $TimerCopyWith<$Res> {
  factory _$TimerCopyWith(_Timer value, $Res Function(_Timer) _then) = __$TimerCopyWithImpl;
@override @useResult
$Res call({
 String id, Duration totalTime, bool isRunning, DateTime? lastStartOn, int? issueId, RedmineIssue? issue, String? subject
});




}
/// @nodoc
class __$TimerCopyWithImpl<$Res>
    implements _$TimerCopyWith<$Res> {
  __$TimerCopyWithImpl(this._self, this._then);

  final _Timer _self;
  final $Res Function(_Timer) _then;

/// Create a copy of Timer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? totalTime = null,Object? isRunning = null,Object? lastStartOn = freezed,Object? issueId = freezed,Object? issue = freezed,Object? subject = freezed,}) {
  return _then(_Timer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,totalTime: null == totalTime ? _self.totalTime : totalTime // ignore: cast_nullable_to_non_nullable
as Duration,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,lastStartOn: freezed == lastStartOn ? _self.lastStartOn : lastStartOn // ignore: cast_nullable_to_non_nullable
as DateTime?,issueId: freezed == issueId ? _self.issueId : issueId // ignore: cast_nullable_to_non_nullable
as int?,issue: freezed == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as RedmineIssue?,subject: freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
