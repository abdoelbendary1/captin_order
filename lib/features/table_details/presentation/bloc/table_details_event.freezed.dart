// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TableDetailsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TableDetailsEvent()';
}


}

/// @nodoc
class $TableDetailsEventCopyWith<$Res>  {
$TableDetailsEventCopyWith(TableDetailsEvent _, $Res Function(TableDetailsEvent) __);
}


/// Adds pattern-matching-related methods to [TableDetailsEvent].
extension TableDetailsEventPatterns on TableDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadDetailsEvent value)?  loadDetails,TResult Function( RequestCheckEvent value)?  requestCheck,TResult Function( MoveTableEvent value)?  moveTable,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadDetailsEvent() when loadDetails != null:
return loadDetails(_that);case RequestCheckEvent() when requestCheck != null:
return requestCheck(_that);case MoveTableEvent() when moveTable != null:
return moveTable(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadDetailsEvent value)  loadDetails,required TResult Function( RequestCheckEvent value)  requestCheck,required TResult Function( MoveTableEvent value)  moveTable,}){
final _that = this;
switch (_that) {
case LoadDetailsEvent():
return loadDetails(_that);case RequestCheckEvent():
return requestCheck(_that);case MoveTableEvent():
return moveTable(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadDetailsEvent value)?  loadDetails,TResult? Function( RequestCheckEvent value)?  requestCheck,TResult? Function( MoveTableEvent value)?  moveTable,}){
final _that = this;
switch (_that) {
case LoadDetailsEvent() when loadDetails != null:
return loadDetails(_that);case RequestCheckEvent() when requestCheck != null:
return requestCheck(_that);case MoveTableEvent() when moveTable != null:
return moveTable(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String tableId)?  loadDetails,TResult Function()?  requestCheck,TResult Function( String newTableNumber)?  moveTable,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadDetailsEvent() when loadDetails != null:
return loadDetails(_that.tableId);case RequestCheckEvent() when requestCheck != null:
return requestCheck();case MoveTableEvent() when moveTable != null:
return moveTable(_that.newTableNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String tableId)  loadDetails,required TResult Function()  requestCheck,required TResult Function( String newTableNumber)  moveTable,}) {final _that = this;
switch (_that) {
case LoadDetailsEvent():
return loadDetails(_that.tableId);case RequestCheckEvent():
return requestCheck();case MoveTableEvent():
return moveTable(_that.newTableNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String tableId)?  loadDetails,TResult? Function()?  requestCheck,TResult? Function( String newTableNumber)?  moveTable,}) {final _that = this;
switch (_that) {
case LoadDetailsEvent() when loadDetails != null:
return loadDetails(_that.tableId);case RequestCheckEvent() when requestCheck != null:
return requestCheck();case MoveTableEvent() when moveTable != null:
return moveTable(_that.newTableNumber);case _:
  return null;

}
}

}

/// @nodoc


class LoadDetailsEvent implements TableDetailsEvent {
  const LoadDetailsEvent({required this.tableId});
  

 final  String tableId;

/// Create a copy of TableDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadDetailsEventCopyWith<LoadDetailsEvent> get copyWith => _$LoadDetailsEventCopyWithImpl<LoadDetailsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadDetailsEvent&&(identical(other.tableId, tableId) || other.tableId == tableId));
}


@override
int get hashCode => Object.hash(runtimeType,tableId);

@override
String toString() {
  return 'TableDetailsEvent.loadDetails(tableId: $tableId)';
}


}

/// @nodoc
abstract mixin class $LoadDetailsEventCopyWith<$Res> implements $TableDetailsEventCopyWith<$Res> {
  factory $LoadDetailsEventCopyWith(LoadDetailsEvent value, $Res Function(LoadDetailsEvent) _then) = _$LoadDetailsEventCopyWithImpl;
@useResult
$Res call({
 String tableId
});




}
/// @nodoc
class _$LoadDetailsEventCopyWithImpl<$Res>
    implements $LoadDetailsEventCopyWith<$Res> {
  _$LoadDetailsEventCopyWithImpl(this._self, this._then);

  final LoadDetailsEvent _self;
  final $Res Function(LoadDetailsEvent) _then;

/// Create a copy of TableDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableId = null,}) {
  return _then(LoadDetailsEvent(
tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RequestCheckEvent implements TableDetailsEvent {
  const RequestCheckEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCheckEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TableDetailsEvent.requestCheck()';
}


}




/// @nodoc


class MoveTableEvent implements TableDetailsEvent {
  const MoveTableEvent({required this.newTableNumber});
  

 final  String newTableNumber;

/// Create a copy of TableDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveTableEventCopyWith<MoveTableEvent> get copyWith => _$MoveTableEventCopyWithImpl<MoveTableEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveTableEvent&&(identical(other.newTableNumber, newTableNumber) || other.newTableNumber == newTableNumber));
}


@override
int get hashCode => Object.hash(runtimeType,newTableNumber);

@override
String toString() {
  return 'TableDetailsEvent.moveTable(newTableNumber: $newTableNumber)';
}


}

/// @nodoc
abstract mixin class $MoveTableEventCopyWith<$Res> implements $TableDetailsEventCopyWith<$Res> {
  factory $MoveTableEventCopyWith(MoveTableEvent value, $Res Function(MoveTableEvent) _then) = _$MoveTableEventCopyWithImpl;
@useResult
$Res call({
 String newTableNumber
});




}
/// @nodoc
class _$MoveTableEventCopyWithImpl<$Res>
    implements $MoveTableEventCopyWith<$Res> {
  _$MoveTableEventCopyWithImpl(this._self, this._then);

  final MoveTableEvent _self;
  final $Res Function(MoveTableEvent) _then;

/// Create a copy of TableDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newTableNumber = null,}) {
  return _then(MoveTableEvent(
newTableNumber: null == newTableNumber ? _self.newTableNumber : newTableNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
