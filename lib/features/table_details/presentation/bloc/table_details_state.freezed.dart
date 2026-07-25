// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TableDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TableDetailsState()';
}


}

/// @nodoc
class $TableDetailsStateCopyWith<$Res>  {
$TableDetailsStateCopyWith(TableDetailsState _, $Res Function(TableDetailsState) __);
}


/// Adds pattern-matching-related methods to [TableDetailsState].
extension TableDetailsStatePatterns on TableDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TableDetailsLoadingState value)?  loading,TResult Function( TableDetailsErrorState value)?  error,TResult Function( TableDetailsSuccessState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TableDetailsLoadingState() when loading != null:
return loading(_that);case TableDetailsErrorState() when error != null:
return error(_that);case TableDetailsSuccessState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TableDetailsLoadingState value)  loading,required TResult Function( TableDetailsErrorState value)  error,required TResult Function( TableDetailsSuccessState value)  success,}){
final _that = this;
switch (_that) {
case TableDetailsLoadingState():
return loading(_that);case TableDetailsErrorState():
return error(_that);case TableDetailsSuccessState():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TableDetailsLoadingState value)?  loading,TResult? Function( TableDetailsErrorState value)?  error,TResult? Function( TableDetailsSuccessState value)?  success,}){
final _that = this;
switch (_that) {
case TableDetailsLoadingState() when loading != null:
return loading(_that);case TableDetailsErrorState() when error != null:
return error(_that);case TableDetailsSuccessState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( TableEntity table,  bool isActionInProgress,  String? message)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TableDetailsLoadingState() when loading != null:
return loading();case TableDetailsErrorState() when error != null:
return error(_that.message);case TableDetailsSuccessState() when success != null:
return success(_that.table,_that.isActionInProgress,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( TableEntity table,  bool isActionInProgress,  String? message)  success,}) {final _that = this;
switch (_that) {
case TableDetailsLoadingState():
return loading();case TableDetailsErrorState():
return error(_that.message);case TableDetailsSuccessState():
return success(_that.table,_that.isActionInProgress,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( TableEntity table,  bool isActionInProgress,  String? message)?  success,}) {final _that = this;
switch (_that) {
case TableDetailsLoadingState() when loading != null:
return loading();case TableDetailsErrorState() when error != null:
return error(_that.message);case TableDetailsSuccessState() when success != null:
return success(_that.table,_that.isActionInProgress,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TableDetailsLoadingState implements TableDetailsState {
  const TableDetailsLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableDetailsLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TableDetailsState.loading()';
}


}




/// @nodoc


class TableDetailsErrorState implements TableDetailsState {
  const TableDetailsErrorState({required this.message});
  

 final  String message;

/// Create a copy of TableDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableDetailsErrorStateCopyWith<TableDetailsErrorState> get copyWith => _$TableDetailsErrorStateCopyWithImpl<TableDetailsErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableDetailsErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TableDetailsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TableDetailsErrorStateCopyWith<$Res> implements $TableDetailsStateCopyWith<$Res> {
  factory $TableDetailsErrorStateCopyWith(TableDetailsErrorState value, $Res Function(TableDetailsErrorState) _then) = _$TableDetailsErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TableDetailsErrorStateCopyWithImpl<$Res>
    implements $TableDetailsErrorStateCopyWith<$Res> {
  _$TableDetailsErrorStateCopyWithImpl(this._self, this._then);

  final TableDetailsErrorState _self;
  final $Res Function(TableDetailsErrorState) _then;

/// Create a copy of TableDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TableDetailsErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TableDetailsSuccessState implements TableDetailsState {
  const TableDetailsSuccessState({required this.table, this.isActionInProgress = false, this.message});
  

 final  TableEntity table;
@JsonKey() final  bool isActionInProgress;
 final  String? message;

/// Create a copy of TableDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableDetailsSuccessStateCopyWith<TableDetailsSuccessState> get copyWith => _$TableDetailsSuccessStateCopyWithImpl<TableDetailsSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableDetailsSuccessState&&(identical(other.table, table) || other.table == table)&&(identical(other.isActionInProgress, isActionInProgress) || other.isActionInProgress == isActionInProgress)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,table,isActionInProgress,message);

@override
String toString() {
  return 'TableDetailsState.success(table: $table, isActionInProgress: $isActionInProgress, message: $message)';
}


}

/// @nodoc
abstract mixin class $TableDetailsSuccessStateCopyWith<$Res> implements $TableDetailsStateCopyWith<$Res> {
  factory $TableDetailsSuccessStateCopyWith(TableDetailsSuccessState value, $Res Function(TableDetailsSuccessState) _then) = _$TableDetailsSuccessStateCopyWithImpl;
@useResult
$Res call({
 TableEntity table, bool isActionInProgress, String? message
});


$TableEntityCopyWith<$Res> get table;

}
/// @nodoc
class _$TableDetailsSuccessStateCopyWithImpl<$Res>
    implements $TableDetailsSuccessStateCopyWith<$Res> {
  _$TableDetailsSuccessStateCopyWithImpl(this._self, this._then);

  final TableDetailsSuccessState _self;
  final $Res Function(TableDetailsSuccessState) _then;

/// Create a copy of TableDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? table = null,Object? isActionInProgress = null,Object? message = freezed,}) {
  return _then(TableDetailsSuccessState(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as TableEntity,isActionInProgress: null == isActionInProgress ? _self.isActionInProgress : isActionInProgress // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TableDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TableEntityCopyWith<$Res> get table {
  
  return $TableEntityCopyWith<$Res>(_self.table, (value) {
    return _then(_self.copyWith(table: value));
  });
}
}

// dart format on
