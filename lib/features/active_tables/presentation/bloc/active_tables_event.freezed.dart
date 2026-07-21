// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_tables_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActiveTablesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveTablesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveTablesEvent()';
}


}

/// @nodoc
class $ActiveTablesEventCopyWith<$Res>  {
$ActiveTablesEventCopyWith(ActiveTablesEvent _, $Res Function(ActiveTablesEvent) __);
}


/// Adds pattern-matching-related methods to [ActiveTablesEvent].
extension ActiveTablesEventPatterns on ActiveTablesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadTables value)?  loadTables,TResult Function( _RefreshTables value)?  refreshTables,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadTables() when loadTables != null:
return loadTables(_that);case _RefreshTables() when refreshTables != null:
return refreshTables(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadTables value)  loadTables,required TResult Function( _RefreshTables value)  refreshTables,}){
final _that = this;
switch (_that) {
case _LoadTables():
return loadTables(_that);case _RefreshTables():
return refreshTables(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadTables value)?  loadTables,TResult? Function( _RefreshTables value)?  refreshTables,}){
final _that = this;
switch (_that) {
case _LoadTables() when loadTables != null:
return loadTables(_that);case _RefreshTables() when refreshTables != null:
return refreshTables(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadTables,TResult Function()?  refreshTables,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadTables() when loadTables != null:
return loadTables();case _RefreshTables() when refreshTables != null:
return refreshTables();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadTables,required TResult Function()  refreshTables,}) {final _that = this;
switch (_that) {
case _LoadTables():
return loadTables();case _RefreshTables():
return refreshTables();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadTables,TResult? Function()?  refreshTables,}) {final _that = this;
switch (_that) {
case _LoadTables() when loadTables != null:
return loadTables();case _RefreshTables() when refreshTables != null:
return refreshTables();case _:
  return null;

}
}

}

/// @nodoc


class _LoadTables implements ActiveTablesEvent {
  const _LoadTables();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadTables);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveTablesEvent.loadTables()';
}


}




/// @nodoc


class _RefreshTables implements ActiveTablesEvent {
  const _RefreshTables();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTables);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveTablesEvent.refreshTables()';
}


}




// dart format on
