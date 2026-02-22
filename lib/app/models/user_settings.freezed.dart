// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSettings {

 String? get redmineApiKey; String? get redmineHost; bool get runMultipleTimersSimultaneously; bool get fetchOnlyIssuesAssignedToMe; int get roundTimeEntryUpToMinute; List<String> get billableTrackers; RedmineIssueStatus get fetchIssuesStatus; bool get deleteTimerAfterTimeEntryPosted;
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<UserSettings> get copyWith => _$UserSettingsCopyWithImpl<UserSettings>(this as UserSettings, _$identity);

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettings&&(identical(other.redmineApiKey, redmineApiKey) || other.redmineApiKey == redmineApiKey)&&(identical(other.redmineHost, redmineHost) || other.redmineHost == redmineHost)&&(identical(other.runMultipleTimersSimultaneously, runMultipleTimersSimultaneously) || other.runMultipleTimersSimultaneously == runMultipleTimersSimultaneously)&&(identical(other.fetchOnlyIssuesAssignedToMe, fetchOnlyIssuesAssignedToMe) || other.fetchOnlyIssuesAssignedToMe == fetchOnlyIssuesAssignedToMe)&&(identical(other.roundTimeEntryUpToMinute, roundTimeEntryUpToMinute) || other.roundTimeEntryUpToMinute == roundTimeEntryUpToMinute)&&const DeepCollectionEquality().equals(other.billableTrackers, billableTrackers)&&(identical(other.fetchIssuesStatus, fetchIssuesStatus) || other.fetchIssuesStatus == fetchIssuesStatus)&&(identical(other.deleteTimerAfterTimeEntryPosted, deleteTimerAfterTimeEntryPosted) || other.deleteTimerAfterTimeEntryPosted == deleteTimerAfterTimeEntryPosted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,redmineApiKey,redmineHost,runMultipleTimersSimultaneously,fetchOnlyIssuesAssignedToMe,roundTimeEntryUpToMinute,const DeepCollectionEquality().hash(billableTrackers),fetchIssuesStatus,deleteTimerAfterTimeEntryPosted);

@override
String toString() {
  return 'UserSettings(redmineApiKey: $redmineApiKey, redmineHost: $redmineHost, runMultipleTimersSimultaneously: $runMultipleTimersSimultaneously, fetchOnlyIssuesAssignedToMe: $fetchOnlyIssuesAssignedToMe, roundTimeEntryUpToMinute: $roundTimeEntryUpToMinute, billableTrackers: $billableTrackers, fetchIssuesStatus: $fetchIssuesStatus, deleteTimerAfterTimeEntryPosted: $deleteTimerAfterTimeEntryPosted)';
}


}

/// @nodoc
abstract mixin class $UserSettingsCopyWith<$Res>  {
  factory $UserSettingsCopyWith(UserSettings value, $Res Function(UserSettings) _then) = _$UserSettingsCopyWithImpl;
@useResult
$Res call({
 String? redmineApiKey, String? redmineHost, bool runMultipleTimersSimultaneously, bool fetchOnlyIssuesAssignedToMe, int roundTimeEntryUpToMinute, List<String> billableTrackers, RedmineIssueStatus fetchIssuesStatus, bool deleteTimerAfterTimeEntryPosted
});




}
/// @nodoc
class _$UserSettingsCopyWithImpl<$Res>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._self, this._then);

  final UserSettings _self;
  final $Res Function(UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? redmineApiKey = freezed,Object? redmineHost = freezed,Object? runMultipleTimersSimultaneously = null,Object? fetchOnlyIssuesAssignedToMe = null,Object? roundTimeEntryUpToMinute = null,Object? billableTrackers = null,Object? fetchIssuesStatus = null,Object? deleteTimerAfterTimeEntryPosted = null,}) {
  return _then(_self.copyWith(
redmineApiKey: freezed == redmineApiKey ? _self.redmineApiKey : redmineApiKey // ignore: cast_nullable_to_non_nullable
as String?,redmineHost: freezed == redmineHost ? _self.redmineHost : redmineHost // ignore: cast_nullable_to_non_nullable
as String?,runMultipleTimersSimultaneously: null == runMultipleTimersSimultaneously ? _self.runMultipleTimersSimultaneously : runMultipleTimersSimultaneously // ignore: cast_nullable_to_non_nullable
as bool,fetchOnlyIssuesAssignedToMe: null == fetchOnlyIssuesAssignedToMe ? _self.fetchOnlyIssuesAssignedToMe : fetchOnlyIssuesAssignedToMe // ignore: cast_nullable_to_non_nullable
as bool,roundTimeEntryUpToMinute: null == roundTimeEntryUpToMinute ? _self.roundTimeEntryUpToMinute : roundTimeEntryUpToMinute // ignore: cast_nullable_to_non_nullable
as int,billableTrackers: null == billableTrackers ? _self.billableTrackers : billableTrackers // ignore: cast_nullable_to_non_nullable
as List<String>,fetchIssuesStatus: null == fetchIssuesStatus ? _self.fetchIssuesStatus : fetchIssuesStatus // ignore: cast_nullable_to_non_nullable
as RedmineIssueStatus,deleteTimerAfterTimeEntryPosted: null == deleteTimerAfterTimeEntryPosted ? _self.deleteTimerAfterTimeEntryPosted : deleteTimerAfterTimeEntryPosted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSettings].
extension UserSettingsPatterns on UserSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSettings value)  $default,){
final _that = this;
switch (_that) {
case _UserSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSettings value)?  $default,){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? redmineApiKey,  String? redmineHost,  bool runMultipleTimersSimultaneously,  bool fetchOnlyIssuesAssignedToMe,  int roundTimeEntryUpToMinute,  List<String> billableTrackers,  RedmineIssueStatus fetchIssuesStatus,  bool deleteTimerAfterTimeEntryPosted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.redmineApiKey,_that.redmineHost,_that.runMultipleTimersSimultaneously,_that.fetchOnlyIssuesAssignedToMe,_that.roundTimeEntryUpToMinute,_that.billableTrackers,_that.fetchIssuesStatus,_that.deleteTimerAfterTimeEntryPosted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? redmineApiKey,  String? redmineHost,  bool runMultipleTimersSimultaneously,  bool fetchOnlyIssuesAssignedToMe,  int roundTimeEntryUpToMinute,  List<String> billableTrackers,  RedmineIssueStatus fetchIssuesStatus,  bool deleteTimerAfterTimeEntryPosted)  $default,) {final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that.redmineApiKey,_that.redmineHost,_that.runMultipleTimersSimultaneously,_that.fetchOnlyIssuesAssignedToMe,_that.roundTimeEntryUpToMinute,_that.billableTrackers,_that.fetchIssuesStatus,_that.deleteTimerAfterTimeEntryPosted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? redmineApiKey,  String? redmineHost,  bool runMultipleTimersSimultaneously,  bool fetchOnlyIssuesAssignedToMe,  int roundTimeEntryUpToMinute,  List<String> billableTrackers,  RedmineIssueStatus fetchIssuesStatus,  bool deleteTimerAfterTimeEntryPosted)?  $default,) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.redmineApiKey,_that.redmineHost,_that.runMultipleTimersSimultaneously,_that.fetchOnlyIssuesAssignedToMe,_that.roundTimeEntryUpToMinute,_that.billableTrackers,_that.fetchIssuesStatus,_that.deleteTimerAfterTimeEntryPosted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSettings implements UserSettings {
  const _UserSettings({this.redmineApiKey, this.redmineHost, this.runMultipleTimersSimultaneously = false, this.fetchOnlyIssuesAssignedToMe = true, this.roundTimeEntryUpToMinute = 15, final  List<String> billableTrackers = const [], this.fetchIssuesStatus = RedmineIssueStatus.open, this.deleteTimerAfterTimeEntryPosted = false}): _billableTrackers = billableTrackers;
  factory _UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);

@override final  String? redmineApiKey;
@override final  String? redmineHost;
@override@JsonKey() final  bool runMultipleTimersSimultaneously;
@override@JsonKey() final  bool fetchOnlyIssuesAssignedToMe;
@override@JsonKey() final  int roundTimeEntryUpToMinute;
 final  List<String> _billableTrackers;
@override@JsonKey() List<String> get billableTrackers {
  if (_billableTrackers is EqualUnmodifiableListView) return _billableTrackers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_billableTrackers);
}

@override@JsonKey() final  RedmineIssueStatus fetchIssuesStatus;
@override@JsonKey() final  bool deleteTimerAfterTimeEntryPosted;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSettingsCopyWith<_UserSettings> get copyWith => __$UserSettingsCopyWithImpl<_UserSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSettings&&(identical(other.redmineApiKey, redmineApiKey) || other.redmineApiKey == redmineApiKey)&&(identical(other.redmineHost, redmineHost) || other.redmineHost == redmineHost)&&(identical(other.runMultipleTimersSimultaneously, runMultipleTimersSimultaneously) || other.runMultipleTimersSimultaneously == runMultipleTimersSimultaneously)&&(identical(other.fetchOnlyIssuesAssignedToMe, fetchOnlyIssuesAssignedToMe) || other.fetchOnlyIssuesAssignedToMe == fetchOnlyIssuesAssignedToMe)&&(identical(other.roundTimeEntryUpToMinute, roundTimeEntryUpToMinute) || other.roundTimeEntryUpToMinute == roundTimeEntryUpToMinute)&&const DeepCollectionEquality().equals(other._billableTrackers, _billableTrackers)&&(identical(other.fetchIssuesStatus, fetchIssuesStatus) || other.fetchIssuesStatus == fetchIssuesStatus)&&(identical(other.deleteTimerAfterTimeEntryPosted, deleteTimerAfterTimeEntryPosted) || other.deleteTimerAfterTimeEntryPosted == deleteTimerAfterTimeEntryPosted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,redmineApiKey,redmineHost,runMultipleTimersSimultaneously,fetchOnlyIssuesAssignedToMe,roundTimeEntryUpToMinute,const DeepCollectionEquality().hash(_billableTrackers),fetchIssuesStatus,deleteTimerAfterTimeEntryPosted);

@override
String toString() {
  return 'UserSettings(redmineApiKey: $redmineApiKey, redmineHost: $redmineHost, runMultipleTimersSimultaneously: $runMultipleTimersSimultaneously, fetchOnlyIssuesAssignedToMe: $fetchOnlyIssuesAssignedToMe, roundTimeEntryUpToMinute: $roundTimeEntryUpToMinute, billableTrackers: $billableTrackers, fetchIssuesStatus: $fetchIssuesStatus, deleteTimerAfterTimeEntryPosted: $deleteTimerAfterTimeEntryPosted)';
}


}

/// @nodoc
abstract mixin class _$UserSettingsCopyWith<$Res> implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(_UserSettings value, $Res Function(_UserSettings) _then) = __$UserSettingsCopyWithImpl;
@override @useResult
$Res call({
 String? redmineApiKey, String? redmineHost, bool runMultipleTimersSimultaneously, bool fetchOnlyIssuesAssignedToMe, int roundTimeEntryUpToMinute, List<String> billableTrackers, RedmineIssueStatus fetchIssuesStatus, bool deleteTimerAfterTimeEntryPosted
});




}
/// @nodoc
class __$UserSettingsCopyWithImpl<$Res>
    implements _$UserSettingsCopyWith<$Res> {
  __$UserSettingsCopyWithImpl(this._self, this._then);

  final _UserSettings _self;
  final $Res Function(_UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? redmineApiKey = freezed,Object? redmineHost = freezed,Object? runMultipleTimersSimultaneously = null,Object? fetchOnlyIssuesAssignedToMe = null,Object? roundTimeEntryUpToMinute = null,Object? billableTrackers = null,Object? fetchIssuesStatus = null,Object? deleteTimerAfterTimeEntryPosted = null,}) {
  return _then(_UserSettings(
redmineApiKey: freezed == redmineApiKey ? _self.redmineApiKey : redmineApiKey // ignore: cast_nullable_to_non_nullable
as String?,redmineHost: freezed == redmineHost ? _self.redmineHost : redmineHost // ignore: cast_nullable_to_non_nullable
as String?,runMultipleTimersSimultaneously: null == runMultipleTimersSimultaneously ? _self.runMultipleTimersSimultaneously : runMultipleTimersSimultaneously // ignore: cast_nullable_to_non_nullable
as bool,fetchOnlyIssuesAssignedToMe: null == fetchOnlyIssuesAssignedToMe ? _self.fetchOnlyIssuesAssignedToMe : fetchOnlyIssuesAssignedToMe // ignore: cast_nullable_to_non_nullable
as bool,roundTimeEntryUpToMinute: null == roundTimeEntryUpToMinute ? _self.roundTimeEntryUpToMinute : roundTimeEntryUpToMinute // ignore: cast_nullable_to_non_nullable
as int,billableTrackers: null == billableTrackers ? _self._billableTrackers : billableTrackers // ignore: cast_nullable_to_non_nullable
as List<String>,fetchIssuesStatus: null == fetchIssuesStatus ? _self.fetchIssuesStatus : fetchIssuesStatus // ignore: cast_nullable_to_non_nullable
as RedmineIssueStatus,deleteTimerAfterTimeEntryPosted: null == deleteTimerAfterTimeEntryPosted ? _self.deleteTimerAfterTimeEntryPosted : deleteTimerAfterTimeEntryPosted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
