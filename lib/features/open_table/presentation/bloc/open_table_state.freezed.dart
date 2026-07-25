// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_table_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OpenTableState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenTableState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OpenTableState()';
}


}

/// @nodoc
class $OpenTableStateCopyWith<$Res>  {
$OpenTableStateCopyWith(OpenTableState _, $Res Function(OpenTableState) __);
}


/// Adds pattern-matching-related methods to [OpenTableState].
extension OpenTableStatePatterns on OpenTableState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( LoadingTablesState value)?  loadingTables,TResult Function( AvailableTablesLoadedState value)?  availableTablesLoaded,TResult Function( Submit value)?  submit,TResult Function( Success value)?  success,TResult Function( FailureState value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingTablesState() when loadingTables != null:
return loadingTables(_that);case AvailableTablesLoadedState() when availableTablesLoaded != null:
return availableTablesLoaded(_that);case Submit() when submit != null:
return submit(_that);case Success() when success != null:
return success(_that);case FailureState() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( LoadingTablesState value)  loadingTables,required TResult Function( AvailableTablesLoadedState value)  availableTablesLoaded,required TResult Function( Submit value)  submit,required TResult Function( Success value)  success,required TResult Function( FailureState value)  failure,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case LoadingTablesState():
return loadingTables(_that);case AvailableTablesLoadedState():
return availableTablesLoaded(_that);case Submit():
return submit(_that);case Success():
return success(_that);case FailureState():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( LoadingTablesState value)?  loadingTables,TResult? Function( AvailableTablesLoadedState value)?  availableTablesLoaded,TResult? Function( Submit value)?  submit,TResult? Function( Success value)?  success,TResult? Function( FailureState value)?  failure,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case LoadingTablesState() when loadingTables != null:
return loadingTables(_that);case AvailableTablesLoadedState() when availableTablesLoaded != null:
return availableTablesLoaded(_that);case Submit() when submit != null:
return submit(_that);case Success() when success != null:
return success(_that);case FailureState() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingTables,TResult Function( List<TableEntity> availableTables)?  availableTablesLoaded,TResult Function()?  submit,TResult Function( TableEntity table)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingTablesState() when loadingTables != null:
return loadingTables();case AvailableTablesLoadedState() when availableTablesLoaded != null:
return availableTablesLoaded(_that.availableTables);case Submit() when submit != null:
return submit();case Success() when success != null:
return success(_that.table);case FailureState() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingTables,required TResult Function( List<TableEntity> availableTables)  availableTablesLoaded,required TResult Function()  submit,required TResult Function( TableEntity table)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case LoadingTablesState():
return loadingTables();case AvailableTablesLoadedState():
return availableTablesLoaded(_that.availableTables);case Submit():
return submit();case Success():
return success(_that.table);case FailureState():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingTables,TResult? Function( List<TableEntity> availableTables)?  availableTablesLoaded,TResult? Function()?  submit,TResult? Function( TableEntity table)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case LoadingTablesState() when loadingTables != null:
return loadingTables();case AvailableTablesLoadedState() when availableTablesLoaded != null:
return availableTablesLoaded(_that.availableTables);case Submit() when submit != null:
return submit();case Success() when success != null:
return success(_that.table);case FailureState() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements OpenTableState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OpenTableState.initial()';
}


}




/// @nodoc


class LoadingTablesState implements OpenTableState {
  const LoadingTablesState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingTablesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OpenTableState.loadingTables()';
}


}




/// @nodoc


class AvailableTablesLoadedState implements OpenTableState {
  const AvailableTablesLoadedState({required final  List<TableEntity> availableTables}): _availableTables = availableTables;
  

 final  List<TableEntity> _availableTables;
 List<TableEntity> get availableTables {
  if (_availableTables is EqualUnmodifiableListView) return _availableTables;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableTables);
}


/// Create a copy of OpenTableState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableTablesLoadedStateCopyWith<AvailableTablesLoadedState> get copyWith => _$AvailableTablesLoadedStateCopyWithImpl<AvailableTablesLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableTablesLoadedState&&const DeepCollectionEquality().equals(other._availableTables, _availableTables));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_availableTables));

@override
String toString() {
  return 'OpenTableState.availableTablesLoaded(availableTables: $availableTables)';
}


}

/// @nodoc
abstract mixin class $AvailableTablesLoadedStateCopyWith<$Res> implements $OpenTableStateCopyWith<$Res> {
  factory $AvailableTablesLoadedStateCopyWith(AvailableTablesLoadedState value, $Res Function(AvailableTablesLoadedState) _then) = _$AvailableTablesLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<TableEntity> availableTables
});




}
/// @nodoc
class _$AvailableTablesLoadedStateCopyWithImpl<$Res>
    implements $AvailableTablesLoadedStateCopyWith<$Res> {
  _$AvailableTablesLoadedStateCopyWithImpl(this._self, this._then);

  final AvailableTablesLoadedState _self;
  final $Res Function(AvailableTablesLoadedState) _then;

/// Create a copy of OpenTableState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? availableTables = null,}) {
  return _then(AvailableTablesLoadedState(
availableTables: null == availableTables ? _self._availableTables : availableTables // ignore: cast_nullable_to_non_nullable
as List<TableEntity>,
  ));
}


}

/// @nodoc


class Submit implements OpenTableState {
  const Submit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Submit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OpenTableState.submit()';
}


}




/// @nodoc


class Success implements OpenTableState {
  const Success(this.table);
  

 final  TableEntity table;

/// Create a copy of OpenTableState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<Success> get copyWith => _$SuccessCopyWithImpl<Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success&&(identical(other.table, table) || other.table == table));
}


@override
int get hashCode => Object.hash(runtimeType,table);

@override
String toString() {
  return 'OpenTableState.success(table: $table)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res> implements $OpenTableStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 TableEntity table
});


$TableEntityCopyWith<$Res> get table;

}
/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

/// Create a copy of OpenTableState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? table = null,}) {
  return _then(Success(
null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as TableEntity,
  ));
}

/// Create a copy of OpenTableState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TableEntityCopyWith<$Res> get table {
  
  return $TableEntityCopyWith<$Res>(_self.table, (value) {
    return _then(_self.copyWith(table: value));
  });
}
}

/// @nodoc


class FailureState implements OpenTableState {
  const FailureState(this.message);
  

 final  String message;

/// Create a copy of OpenTableState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureStateCopyWith<FailureState> get copyWith => _$FailureStateCopyWithImpl<FailureState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'OpenTableState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureStateCopyWith<$Res> implements $OpenTableStateCopyWith<$Res> {
  factory $FailureStateCopyWith(FailureState value, $Res Function(FailureState) _then) = _$FailureStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailureStateCopyWithImpl<$Res>
    implements $FailureStateCopyWith<$Res> {
  _$FailureStateCopyWithImpl(this._self, this._then);

  final FailureState _self;
  final $Res Function(FailureState) _then;

/// Create a copy of OpenTableState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FailureState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
