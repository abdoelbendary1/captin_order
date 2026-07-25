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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadTablesEvent value)?  loadTables,TResult Function( RefreshTablesEvent value)?  refreshTables,TResult Function( SelectTabEvent value)?  selectTab,TResult Function( SearchTablesEvent value)?  searchTables,TResult Function( RetryEvent value)?  retry,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadTablesEvent() when loadTables != null:
return loadTables(_that);case RefreshTablesEvent() when refreshTables != null:
return refreshTables(_that);case SelectTabEvent() when selectTab != null:
return selectTab(_that);case SearchTablesEvent() when searchTables != null:
return searchTables(_that);case RetryEvent() when retry != null:
return retry(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadTablesEvent value)  loadTables,required TResult Function( RefreshTablesEvent value)  refreshTables,required TResult Function( SelectTabEvent value)  selectTab,required TResult Function( SearchTablesEvent value)  searchTables,required TResult Function( RetryEvent value)  retry,}){
final _that = this;
switch (_that) {
case LoadTablesEvent():
return loadTables(_that);case RefreshTablesEvent():
return refreshTables(_that);case SelectTabEvent():
return selectTab(_that);case SearchTablesEvent():
return searchTables(_that);case RetryEvent():
return retry(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadTablesEvent value)?  loadTables,TResult? Function( RefreshTablesEvent value)?  refreshTables,TResult? Function( SelectTabEvent value)?  selectTab,TResult? Function( SearchTablesEvent value)?  searchTables,TResult? Function( RetryEvent value)?  retry,}){
final _that = this;
switch (_that) {
case LoadTablesEvent() when loadTables != null:
return loadTables(_that);case RefreshTablesEvent() when refreshTables != null:
return refreshTables(_that);case SelectTabEvent() when selectTab != null:
return selectTab(_that);case SearchTablesEvent() when searchTables != null:
return searchTables(_that);case RetryEvent() when retry != null:
return retry(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadTables,TResult Function()?  refreshTables,TResult Function( int index)?  selectTab,TResult Function( String query)?  searchTables,TResult Function()?  retry,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadTablesEvent() when loadTables != null:
return loadTables();case RefreshTablesEvent() when refreshTables != null:
return refreshTables();case SelectTabEvent() when selectTab != null:
return selectTab(_that.index);case SearchTablesEvent() when searchTables != null:
return searchTables(_that.query);case RetryEvent() when retry != null:
return retry();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadTables,required TResult Function()  refreshTables,required TResult Function( int index)  selectTab,required TResult Function( String query)  searchTables,required TResult Function()  retry,}) {final _that = this;
switch (_that) {
case LoadTablesEvent():
return loadTables();case RefreshTablesEvent():
return refreshTables();case SelectTabEvent():
return selectTab(_that.index);case SearchTablesEvent():
return searchTables(_that.query);case RetryEvent():
return retry();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadTables,TResult? Function()?  refreshTables,TResult? Function( int index)?  selectTab,TResult? Function( String query)?  searchTables,TResult? Function()?  retry,}) {final _that = this;
switch (_that) {
case LoadTablesEvent() when loadTables != null:
return loadTables();case RefreshTablesEvent() when refreshTables != null:
return refreshTables();case SelectTabEvent() when selectTab != null:
return selectTab(_that.index);case SearchTablesEvent() when searchTables != null:
return searchTables(_that.query);case RetryEvent() when retry != null:
return retry();case _:
  return null;

}
}

}

/// @nodoc


class LoadTablesEvent implements ActiveTablesEvent {
  const LoadTablesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTablesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveTablesEvent.loadTables()';
}


}




/// @nodoc


class RefreshTablesEvent implements ActiveTablesEvent {
  const RefreshTablesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTablesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveTablesEvent.refreshTables()';
}


}




/// @nodoc


class SelectTabEvent implements ActiveTablesEvent {
  const SelectTabEvent({required this.index});
  

 final  int index;

/// Create a copy of ActiveTablesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectTabEventCopyWith<SelectTabEvent> get copyWith => _$SelectTabEventCopyWithImpl<SelectTabEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectTabEvent&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'ActiveTablesEvent.selectTab(index: $index)';
}


}

/// @nodoc
abstract mixin class $SelectTabEventCopyWith<$Res> implements $ActiveTablesEventCopyWith<$Res> {
  factory $SelectTabEventCopyWith(SelectTabEvent value, $Res Function(SelectTabEvent) _then) = _$SelectTabEventCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$SelectTabEventCopyWithImpl<$Res>
    implements $SelectTabEventCopyWith<$Res> {
  _$SelectTabEventCopyWithImpl(this._self, this._then);

  final SelectTabEvent _self;
  final $Res Function(SelectTabEvent) _then;

/// Create a copy of ActiveTablesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(SelectTabEvent(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SearchTablesEvent implements ActiveTablesEvent {
  const SearchTablesEvent({required this.query});
  

 final  String query;

/// Create a copy of ActiveTablesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchTablesEventCopyWith<SearchTablesEvent> get copyWith => _$SearchTablesEventCopyWithImpl<SearchTablesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchTablesEvent&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'ActiveTablesEvent.searchTables(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchTablesEventCopyWith<$Res> implements $ActiveTablesEventCopyWith<$Res> {
  factory $SearchTablesEventCopyWith(SearchTablesEvent value, $Res Function(SearchTablesEvent) _then) = _$SearchTablesEventCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchTablesEventCopyWithImpl<$Res>
    implements $SearchTablesEventCopyWith<$Res> {
  _$SearchTablesEventCopyWithImpl(this._self, this._then);

  final SearchTablesEvent _self;
  final $Res Function(SearchTablesEvent) _then;

/// Create a copy of ActiveTablesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchTablesEvent(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RetryEvent implements ActiveTablesEvent {
  const RetryEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RetryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveTablesEvent.retry()';
}


}




// dart format on
