// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_table_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OpenTableEvent {

 String get tableNumber; int get guestCount; String get areaName;
/// Create a copy of OpenTableEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenTableEventCopyWith<OpenTableEvent> get copyWith => _$OpenTableEventCopyWithImpl<OpenTableEvent>(this as OpenTableEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenTableEvent&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.guestCount, guestCount) || other.guestCount == guestCount)&&(identical(other.areaName, areaName) || other.areaName == areaName));
}


@override
int get hashCode => Object.hash(runtimeType,tableNumber,guestCount,areaName);

@override
String toString() {
  return 'OpenTableEvent(tableNumber: $tableNumber, guestCount: $guestCount, areaName: $areaName)';
}


}

/// @nodoc
abstract mixin class $OpenTableEventCopyWith<$Res>  {
  factory $OpenTableEventCopyWith(OpenTableEvent value, $Res Function(OpenTableEvent) _then) = _$OpenTableEventCopyWithImpl;
@useResult
$Res call({
 String tableNumber, int guestCount, String areaName
});




}
/// @nodoc
class _$OpenTableEventCopyWithImpl<$Res>
    implements $OpenTableEventCopyWith<$Res> {
  _$OpenTableEventCopyWithImpl(this._self, this._then);

  final OpenTableEvent _self;
  final $Res Function(OpenTableEvent) _then;

/// Create a copy of OpenTableEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tableNumber = null,Object? guestCount = null,Object? areaName = null,}) {
  return _then(_self.copyWith(
tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,guestCount: null == guestCount ? _self.guestCount : guestCount // ignore: cast_nullable_to_non_nullable
as int,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenTableEvent].
extension OpenTableEventPatterns on OpenTableEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Submit value)?  submit,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Submit() when submit != null:
return submit(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Submit value)  submit,}){
final _that = this;
switch (_that) {
case Submit():
return submit(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Submit value)?  submit,}){
final _that = this;
switch (_that) {
case Submit() when submit != null:
return submit(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String tableNumber,  int guestCount,  String areaName)?  submit,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Submit() when submit != null:
return submit(_that.tableNumber,_that.guestCount,_that.areaName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String tableNumber,  int guestCount,  String areaName)  submit,}) {final _that = this;
switch (_that) {
case Submit():
return submit(_that.tableNumber,_that.guestCount,_that.areaName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String tableNumber,  int guestCount,  String areaName)?  submit,}) {final _that = this;
switch (_that) {
case Submit() when submit != null:
return submit(_that.tableNumber,_that.guestCount,_that.areaName);case _:
  return null;

}
}

}

/// @nodoc


class Submit implements OpenTableEvent {
  const Submit({required this.tableNumber, required this.guestCount, required this.areaName});
  

@override final  String tableNumber;
@override final  int guestCount;
@override final  String areaName;

/// Create a copy of OpenTableEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitCopyWith<Submit> get copyWith => _$SubmitCopyWithImpl<Submit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Submit&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.guestCount, guestCount) || other.guestCount == guestCount)&&(identical(other.areaName, areaName) || other.areaName == areaName));
}


@override
int get hashCode => Object.hash(runtimeType,tableNumber,guestCount,areaName);

@override
String toString() {
  return 'OpenTableEvent.submit(tableNumber: $tableNumber, guestCount: $guestCount, areaName: $areaName)';
}


}

/// @nodoc
abstract mixin class $SubmitCopyWith<$Res> implements $OpenTableEventCopyWith<$Res> {
  factory $SubmitCopyWith(Submit value, $Res Function(Submit) _then) = _$SubmitCopyWithImpl;
@override @useResult
$Res call({
 String tableNumber, int guestCount, String areaName
});




}
/// @nodoc
class _$SubmitCopyWithImpl<$Res>
    implements $SubmitCopyWith<$Res> {
  _$SubmitCopyWithImpl(this._self, this._then);

  final Submit _self;
  final $Res Function(Submit) _then;

/// Create a copy of OpenTableEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tableNumber = null,Object? guestCount = null,Object? areaName = null,}) {
  return _then(Submit(
tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,guestCount: null == guestCount ? _self.guestCount : guestCount // ignore: cast_nullable_to_non_nullable
as int,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
