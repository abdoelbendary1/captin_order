// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_tables_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActiveTablesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveTablesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveTablesState()';
}


}

/// @nodoc
class $ActiveTablesStateCopyWith<$Res>  {
$ActiveTablesStateCopyWith(ActiveTablesState _, $Res Function(ActiveTablesState) __);
}


/// Adds pattern-matching-related methods to [ActiveTablesState].
extension ActiveTablesStatePatterns on ActiveTablesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingState value)?  loading,TResult Function( ErrorState value)?  error,TResult Function( SuccessState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading(_that);case ErrorState() when error != null:
return error(_that);case SuccessState() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingState value)  loading,required TResult Function( ErrorState value)  error,required TResult Function( SuccessState value)  success,}){
final _that = this;
switch (_that) {
case LoadingState():
return loading(_that);case ErrorState():
return error(_that);case SuccessState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingState value)?  loading,TResult? Function( ErrorState value)?  error,TResult? Function( SuccessState value)?  success,}){
final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading(_that);case ErrorState() when error != null:
return error(_that);case SuccessState() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( List<TableEntity> insideTables,  List<TableEntity> outsideTables,  int selectedTabIndex,  TableStatusFilter selectedFilter,  int allCount,  int availableCount,  int occupiedCount)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading();case ErrorState() when error != null:
return error(_that.message);case SuccessState() when success != null:
return success(_that.insideTables,_that.outsideTables,_that.selectedTabIndex,_that.selectedFilter,_that.allCount,_that.availableCount,_that.occupiedCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( List<TableEntity> insideTables,  List<TableEntity> outsideTables,  int selectedTabIndex,  TableStatusFilter selectedFilter,  int allCount,  int availableCount,  int occupiedCount)  success,}) {final _that = this;
switch (_that) {
case LoadingState():
return loading();case ErrorState():
return error(_that.message);case SuccessState():
return success(_that.insideTables,_that.outsideTables,_that.selectedTabIndex,_that.selectedFilter,_that.allCount,_that.availableCount,_that.occupiedCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( List<TableEntity> insideTables,  List<TableEntity> outsideTables,  int selectedTabIndex,  TableStatusFilter selectedFilter,  int allCount,  int availableCount,  int occupiedCount)?  success,}) {final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading();case ErrorState() when error != null:
return error(_that.message);case SuccessState() when success != null:
return success(_that.insideTables,_that.outsideTables,_that.selectedTabIndex,_that.selectedFilter,_that.allCount,_that.availableCount,_that.occupiedCount);case _:
  return null;

}
}

}

/// @nodoc


class LoadingState implements ActiveTablesState {
  const LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveTablesState.loading()';
}


}




/// @nodoc


class ErrorState implements ActiveTablesState {
  const ErrorState({required this.message});
  

 final  String message;

/// Create a copy of ActiveTablesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorStateCopyWith<ErrorState> get copyWith => _$ErrorStateCopyWithImpl<ErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ActiveTablesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res> implements $ActiveTablesStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(ErrorState value, $Res Function(ErrorState) _then) = _$ErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorStateCopyWithImpl<$Res>
    implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._self, this._then);

  final ErrorState _self;
  final $Res Function(ErrorState) _then;

/// Create a copy of ActiveTablesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SuccessState implements ActiveTablesState {
  const SuccessState({required final  List<TableEntity> insideTables, required final  List<TableEntity> outsideTables, this.selectedTabIndex = 0, this.selectedFilter = TableStatusFilter.all, this.allCount = 0, this.availableCount = 0, this.occupiedCount = 0}): _insideTables = insideTables,_outsideTables = outsideTables;
  

 final  List<TableEntity> _insideTables;
 List<TableEntity> get insideTables {
  if (_insideTables is EqualUnmodifiableListView) return _insideTables;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_insideTables);
}

 final  List<TableEntity> _outsideTables;
 List<TableEntity> get outsideTables {
  if (_outsideTables is EqualUnmodifiableListView) return _outsideTables;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_outsideTables);
}

@JsonKey() final  int selectedTabIndex;
@JsonKey() final  TableStatusFilter selectedFilter;
@JsonKey() final  int allCount;
@JsonKey() final  int availableCount;
@JsonKey() final  int occupiedCount;

/// Create a copy of ActiveTablesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessStateCopyWith<SuccessState> get copyWith => _$SuccessStateCopyWithImpl<SuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessState&&const DeepCollectionEquality().equals(other._insideTables, _insideTables)&&const DeepCollectionEquality().equals(other._outsideTables, _outsideTables)&&(identical(other.selectedTabIndex, selectedTabIndex) || other.selectedTabIndex == selectedTabIndex)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.allCount, allCount) || other.allCount == allCount)&&(identical(other.availableCount, availableCount) || other.availableCount == availableCount)&&(identical(other.occupiedCount, occupiedCount) || other.occupiedCount == occupiedCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_insideTables),const DeepCollectionEquality().hash(_outsideTables),selectedTabIndex,selectedFilter,allCount,availableCount,occupiedCount);

@override
String toString() {
  return 'ActiveTablesState.success(insideTables: $insideTables, outsideTables: $outsideTables, selectedTabIndex: $selectedTabIndex, selectedFilter: $selectedFilter, allCount: $allCount, availableCount: $availableCount, occupiedCount: $occupiedCount)';
}


}

/// @nodoc
abstract mixin class $SuccessStateCopyWith<$Res> implements $ActiveTablesStateCopyWith<$Res> {
  factory $SuccessStateCopyWith(SuccessState value, $Res Function(SuccessState) _then) = _$SuccessStateCopyWithImpl;
@useResult
$Res call({
 List<TableEntity> insideTables, List<TableEntity> outsideTables, int selectedTabIndex, TableStatusFilter selectedFilter, int allCount, int availableCount, int occupiedCount
});




}
/// @nodoc
class _$SuccessStateCopyWithImpl<$Res>
    implements $SuccessStateCopyWith<$Res> {
  _$SuccessStateCopyWithImpl(this._self, this._then);

  final SuccessState _self;
  final $Res Function(SuccessState) _then;

/// Create a copy of ActiveTablesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? insideTables = null,Object? outsideTables = null,Object? selectedTabIndex = null,Object? selectedFilter = null,Object? allCount = null,Object? availableCount = null,Object? occupiedCount = null,}) {
  return _then(SuccessState(
insideTables: null == insideTables ? _self._insideTables : insideTables // ignore: cast_nullable_to_non_nullable
as List<TableEntity>,outsideTables: null == outsideTables ? _self._outsideTables : outsideTables // ignore: cast_nullable_to_non_nullable
as List<TableEntity>,selectedTabIndex: null == selectedTabIndex ? _self.selectedTabIndex : selectedTabIndex // ignore: cast_nullable_to_non_nullable
as int,selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as TableStatusFilter,allCount: null == allCount ? _self.allCount : allCount // ignore: cast_nullable_to_non_nullable
as int,availableCount: null == availableCount ? _self.availableCount : availableCount // ignore: cast_nullable_to_non_nullable
as int,occupiedCount: null == occupiedCount ? _self.occupiedCount : occupiedCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
