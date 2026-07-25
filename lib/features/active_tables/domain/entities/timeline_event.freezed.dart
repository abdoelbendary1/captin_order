// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimelineEvent {

 String get id; String get title; DateTime get timestamp; String get actor;
/// Create a copy of TimelineEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineEventCopyWith<TimelineEvent> get copyWith => _$TimelineEventCopyWithImpl<TimelineEvent>(this as TimelineEvent, _$identity);

  /// Serializes this TimelineEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelineEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.actor, actor) || other.actor == actor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,timestamp,actor);

@override
String toString() {
  return 'TimelineEvent(id: $id, title: $title, timestamp: $timestamp, actor: $actor)';
}


}

/// @nodoc
abstract mixin class $TimelineEventCopyWith<$Res>  {
  factory $TimelineEventCopyWith(TimelineEvent value, $Res Function(TimelineEvent) _then) = _$TimelineEventCopyWithImpl;
@useResult
$Res call({
 String id, String title, DateTime timestamp, String actor
});




}
/// @nodoc
class _$TimelineEventCopyWithImpl<$Res>
    implements $TimelineEventCopyWith<$Res> {
  _$TimelineEventCopyWithImpl(this._self, this._then);

  final TimelineEvent _self;
  final $Res Function(TimelineEvent) _then;

/// Create a copy of TimelineEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? timestamp = null,Object? actor = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,actor: null == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TimelineEvent].
extension TimelineEventPatterns on TimelineEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimelineEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimelineEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimelineEvent value)  $default,){
final _that = this;
switch (_that) {
case _TimelineEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimelineEvent value)?  $default,){
final _that = this;
switch (_that) {
case _TimelineEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  DateTime timestamp,  String actor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimelineEvent() when $default != null:
return $default(_that.id,_that.title,_that.timestamp,_that.actor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  DateTime timestamp,  String actor)  $default,) {final _that = this;
switch (_that) {
case _TimelineEvent():
return $default(_that.id,_that.title,_that.timestamp,_that.actor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  DateTime timestamp,  String actor)?  $default,) {final _that = this;
switch (_that) {
case _TimelineEvent() when $default != null:
return $default(_that.id,_that.title,_that.timestamp,_that.actor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimelineEvent implements TimelineEvent {
  const _TimelineEvent({required this.id, required this.title, required this.timestamp, required this.actor});
  factory _TimelineEvent.fromJson(Map<String, dynamic> json) => _$TimelineEventFromJson(json);

@override final  String id;
@override final  String title;
@override final  DateTime timestamp;
@override final  String actor;

/// Create a copy of TimelineEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelineEventCopyWith<_TimelineEvent> get copyWith => __$TimelineEventCopyWithImpl<_TimelineEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelineEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimelineEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.actor, actor) || other.actor == actor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,timestamp,actor);

@override
String toString() {
  return 'TimelineEvent(id: $id, title: $title, timestamp: $timestamp, actor: $actor)';
}


}

/// @nodoc
abstract mixin class _$TimelineEventCopyWith<$Res> implements $TimelineEventCopyWith<$Res> {
  factory _$TimelineEventCopyWith(_TimelineEvent value, $Res Function(_TimelineEvent) _then) = __$TimelineEventCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, DateTime timestamp, String actor
});




}
/// @nodoc
class __$TimelineEventCopyWithImpl<$Res>
    implements _$TimelineEventCopyWith<$Res> {
  __$TimelineEventCopyWithImpl(this._self, this._then);

  final _TimelineEvent _self;
  final $Res Function(_TimelineEvent) _then;

/// Create a copy of TimelineEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? timestamp = null,Object? actor = null,}) {
  return _then(_TimelineEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,actor: null == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
