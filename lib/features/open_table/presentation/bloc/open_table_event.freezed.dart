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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenTableEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OpenTableEvent()';
}


}

/// @nodoc
class $OpenTableEventCopyWith<$Res>  {
$OpenTableEventCopyWith(OpenTableEvent _, $Res Function(OpenTableEvent) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadAvailableTablesEvent value)?  loadAvailableTables,TResult Function( SubmitEvent value)?  submit,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadAvailableTablesEvent() when loadAvailableTables != null:
return loadAvailableTables(_that);case SubmitEvent() when submit != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadAvailableTablesEvent value)  loadAvailableTables,required TResult Function( SubmitEvent value)  submit,}){
final _that = this;
switch (_that) {
case LoadAvailableTablesEvent():
return loadAvailableTables(_that);case SubmitEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadAvailableTablesEvent value)?  loadAvailableTables,TResult? Function( SubmitEvent value)?  submit,}){
final _that = this;
switch (_that) {
case LoadAvailableTablesEvent() when loadAvailableTables != null:
return loadAvailableTables(_that);case SubmitEvent() when submit != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TableLocation location)?  loadAvailableTables,TResult Function( String tableNumber,  int guestCount,  String areaName)?  submit,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadAvailableTablesEvent() when loadAvailableTables != null:
return loadAvailableTables(_that.location);case SubmitEvent() when submit != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TableLocation location)  loadAvailableTables,required TResult Function( String tableNumber,  int guestCount,  String areaName)  submit,}) {final _that = this;
switch (_that) {
case LoadAvailableTablesEvent():
return loadAvailableTables(_that.location);case SubmitEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TableLocation location)?  loadAvailableTables,TResult? Function( String tableNumber,  int guestCount,  String areaName)?  submit,}) {final _that = this;
switch (_that) {
case LoadAvailableTablesEvent() when loadAvailableTables != null:
return loadAvailableTables(_that.location);case SubmitEvent() when submit != null:
return submit(_that.tableNumber,_that.guestCount,_that.areaName);case _:
  return null;

}
}

}

/// @nodoc


class LoadAvailableTablesEvent implements OpenTableEvent {
  const LoadAvailableTablesEvent({required this.location});
  

 final  TableLocation location;

/// Create a copy of OpenTableEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadAvailableTablesEventCopyWith<LoadAvailableTablesEvent> get copyWith => _$LoadAvailableTablesEventCopyWithImpl<LoadAvailableTablesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadAvailableTablesEvent&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,location);

@override
String toString() {
  return 'OpenTableEvent.loadAvailableTables(location: $location)';
}


}

/// @nodoc
abstract mixin class $LoadAvailableTablesEventCopyWith<$Res> implements $OpenTableEventCopyWith<$Res> {
  factory $LoadAvailableTablesEventCopyWith(LoadAvailableTablesEvent value, $Res Function(LoadAvailableTablesEvent) _then) = _$LoadAvailableTablesEventCopyWithImpl;
@useResult
$Res call({
 TableLocation location
});




}
/// @nodoc
class _$LoadAvailableTablesEventCopyWithImpl<$Res>
    implements $LoadAvailableTablesEventCopyWith<$Res> {
  _$LoadAvailableTablesEventCopyWithImpl(this._self, this._then);

  final LoadAvailableTablesEvent _self;
  final $Res Function(LoadAvailableTablesEvent) _then;

/// Create a copy of OpenTableEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? location = null,}) {
  return _then(LoadAvailableTablesEvent(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as TableLocation,
  ));
}


}

/// @nodoc


class SubmitEvent implements OpenTableEvent {
  const SubmitEvent({required this.tableNumber, required this.guestCount, required this.areaName});
  

 final  String tableNumber;
 final  int guestCount;
 final  String areaName;

/// Create a copy of OpenTableEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitEventCopyWith<SubmitEvent> get copyWith => _$SubmitEventCopyWithImpl<SubmitEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitEvent&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.guestCount, guestCount) || other.guestCount == guestCount)&&(identical(other.areaName, areaName) || other.areaName == areaName));
}


@override
int get hashCode => Object.hash(runtimeType,tableNumber,guestCount,areaName);

@override
String toString() {
  return 'OpenTableEvent.submit(tableNumber: $tableNumber, guestCount: $guestCount, areaName: $areaName)';
}


}

/// @nodoc
abstract mixin class $SubmitEventCopyWith<$Res> implements $OpenTableEventCopyWith<$Res> {
  factory $SubmitEventCopyWith(SubmitEvent value, $Res Function(SubmitEvent) _then) = _$SubmitEventCopyWithImpl;
@useResult
$Res call({
 String tableNumber, int guestCount, String areaName
});




}
/// @nodoc
class _$SubmitEventCopyWithImpl<$Res>
    implements $SubmitEventCopyWith<$Res> {
  _$SubmitEventCopyWithImpl(this._self, this._then);

  final SubmitEvent _self;
  final $Res Function(SubmitEvent) _then;

/// Create a copy of OpenTableEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableNumber = null,Object? guestCount = null,Object? areaName = null,}) {
  return _then(SubmitEvent(
tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,guestCount: null == guestCount ? _self.guestCount : guestCount // ignore: cast_nullable_to_non_nullable
as int,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
