// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_items_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderItemsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderItemsState()';
}


}

/// @nodoc
class $OrderItemsStateCopyWith<$Res>  {
$OrderItemsStateCopyWith(OrderItemsState _, $Res Function(OrderItemsState) __);
}


/// Adds pattern-matching-related methods to [OrderItemsState].
extension OrderItemsStatePatterns on OrderItemsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadingState value)?  loading,TResult Function( ErrorState value)?  error,TResult Function( SuccessState value)?  success,TResult Function( ConfirmedState value)?  confirmed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading(_that);case ErrorState() when error != null:
return error(_that);case SuccessState() when success != null:
return success(_that);case ConfirmedState() when confirmed != null:
return confirmed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadingState value)  loading,required TResult Function( ErrorState value)  error,required TResult Function( SuccessState value)  success,required TResult Function( ConfirmedState value)  confirmed,}){
final _that = this;
switch (_that) {
case LoadingState():
return loading(_that);case ErrorState():
return error(_that);case SuccessState():
return success(_that);case ConfirmedState():
return confirmed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadingState value)?  loading,TResult? Function( ErrorState value)?  error,TResult? Function( SuccessState value)?  success,TResult? Function( ConfirmedState value)?  confirmed,}){
final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading(_that);case ErrorState() when error != null:
return error(_that);case SuccessState() when success != null:
return success(_that);case ConfirmedState() when confirmed != null:
return confirmed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( List<MenuItemEntity> allItems,  List<MenuItemEntity> filteredItems,  List<SelectedOrderItem> selectedItems,  List<String> categories,  String selectedCategory,  String searchQuery,  bool isConfirming)?  success,TResult Function( TableEntity table)?  confirmed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading();case ErrorState() when error != null:
return error(_that.message);case SuccessState() when success != null:
return success(_that.allItems,_that.filteredItems,_that.selectedItems,_that.categories,_that.selectedCategory,_that.searchQuery,_that.isConfirming);case ConfirmedState() when confirmed != null:
return confirmed(_that.table);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( List<MenuItemEntity> allItems,  List<MenuItemEntity> filteredItems,  List<SelectedOrderItem> selectedItems,  List<String> categories,  String selectedCategory,  String searchQuery,  bool isConfirming)  success,required TResult Function( TableEntity table)  confirmed,}) {final _that = this;
switch (_that) {
case LoadingState():
return loading();case ErrorState():
return error(_that.message);case SuccessState():
return success(_that.allItems,_that.filteredItems,_that.selectedItems,_that.categories,_that.selectedCategory,_that.searchQuery,_that.isConfirming);case ConfirmedState():
return confirmed(_that.table);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( List<MenuItemEntity> allItems,  List<MenuItemEntity> filteredItems,  List<SelectedOrderItem> selectedItems,  List<String> categories,  String selectedCategory,  String searchQuery,  bool isConfirming)?  success,TResult? Function( TableEntity table)?  confirmed,}) {final _that = this;
switch (_that) {
case LoadingState() when loading != null:
return loading();case ErrorState() when error != null:
return error(_that.message);case SuccessState() when success != null:
return success(_that.allItems,_that.filteredItems,_that.selectedItems,_that.categories,_that.selectedCategory,_that.searchQuery,_that.isConfirming);case ConfirmedState() when confirmed != null:
return confirmed(_that.table);case _:
  return null;

}
}

}

/// @nodoc


class LoadingState implements OrderItemsState {
  const LoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderItemsState.loading()';
}


}




/// @nodoc


class ErrorState implements OrderItemsState {
  const ErrorState({required this.message});
  

 final  String message;

/// Create a copy of OrderItemsState
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
  return 'OrderItemsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorStateCopyWith<$Res> implements $OrderItemsStateCopyWith<$Res> {
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

/// Create a copy of OrderItemsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SuccessState implements OrderItemsState {
  const SuccessState({required final  List<MenuItemEntity> allItems, required final  List<MenuItemEntity> filteredItems, required final  List<SelectedOrderItem> selectedItems, required final  List<String> categories, required this.selectedCategory, this.searchQuery = '', this.isConfirming = false}): _allItems = allItems,_filteredItems = filteredItems,_selectedItems = selectedItems,_categories = categories;
  

 final  List<MenuItemEntity> _allItems;
 List<MenuItemEntity> get allItems {
  if (_allItems is EqualUnmodifiableListView) return _allItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allItems);
}

 final  List<MenuItemEntity> _filteredItems;
 List<MenuItemEntity> get filteredItems {
  if (_filteredItems is EqualUnmodifiableListView) return _filteredItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredItems);
}

 final  List<SelectedOrderItem> _selectedItems;
 List<SelectedOrderItem> get selectedItems {
  if (_selectedItems is EqualUnmodifiableListView) return _selectedItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedItems);
}

 final  List<String> _categories;
 List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  String selectedCategory;
@JsonKey() final  String searchQuery;
@JsonKey() final  bool isConfirming;

/// Create a copy of OrderItemsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessStateCopyWith<SuccessState> get copyWith => _$SuccessStateCopyWithImpl<SuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessState&&const DeepCollectionEquality().equals(other._allItems, _allItems)&&const DeepCollectionEquality().equals(other._filteredItems, _filteredItems)&&const DeepCollectionEquality().equals(other._selectedItems, _selectedItems)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isConfirming, isConfirming) || other.isConfirming == isConfirming));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allItems),const DeepCollectionEquality().hash(_filteredItems),const DeepCollectionEquality().hash(_selectedItems),const DeepCollectionEquality().hash(_categories),selectedCategory,searchQuery,isConfirming);

@override
String toString() {
  return 'OrderItemsState.success(allItems: $allItems, filteredItems: $filteredItems, selectedItems: $selectedItems, categories: $categories, selectedCategory: $selectedCategory, searchQuery: $searchQuery, isConfirming: $isConfirming)';
}


}

/// @nodoc
abstract mixin class $SuccessStateCopyWith<$Res> implements $OrderItemsStateCopyWith<$Res> {
  factory $SuccessStateCopyWith(SuccessState value, $Res Function(SuccessState) _then) = _$SuccessStateCopyWithImpl;
@useResult
$Res call({
 List<MenuItemEntity> allItems, List<MenuItemEntity> filteredItems, List<SelectedOrderItem> selectedItems, List<String> categories, String selectedCategory, String searchQuery, bool isConfirming
});




}
/// @nodoc
class _$SuccessStateCopyWithImpl<$Res>
    implements $SuccessStateCopyWith<$Res> {
  _$SuccessStateCopyWithImpl(this._self, this._then);

  final SuccessState _self;
  final $Res Function(SuccessState) _then;

/// Create a copy of OrderItemsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? allItems = null,Object? filteredItems = null,Object? selectedItems = null,Object? categories = null,Object? selectedCategory = null,Object? searchQuery = null,Object? isConfirming = null,}) {
  return _then(SuccessState(
allItems: null == allItems ? _self._allItems : allItems // ignore: cast_nullable_to_non_nullable
as List<MenuItemEntity>,filteredItems: null == filteredItems ? _self._filteredItems : filteredItems // ignore: cast_nullable_to_non_nullable
as List<MenuItemEntity>,selectedItems: null == selectedItems ? _self._selectedItems : selectedItems // ignore: cast_nullable_to_non_nullable
as List<SelectedOrderItem>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isConfirming: null == isConfirming ? _self.isConfirming : isConfirming // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ConfirmedState implements OrderItemsState {
  const ConfirmedState({required this.table});
  

 final  TableEntity table;

/// Create a copy of OrderItemsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmedStateCopyWith<ConfirmedState> get copyWith => _$ConfirmedStateCopyWithImpl<ConfirmedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmedState&&(identical(other.table, table) || other.table == table));
}


@override
int get hashCode => Object.hash(runtimeType,table);

@override
String toString() {
  return 'OrderItemsState.confirmed(table: $table)';
}


}

/// @nodoc
abstract mixin class $ConfirmedStateCopyWith<$Res> implements $OrderItemsStateCopyWith<$Res> {
  factory $ConfirmedStateCopyWith(ConfirmedState value, $Res Function(ConfirmedState) _then) = _$ConfirmedStateCopyWithImpl;
@useResult
$Res call({
 TableEntity table
});


$TableEntityCopyWith<$Res> get table;

}
/// @nodoc
class _$ConfirmedStateCopyWithImpl<$Res>
    implements $ConfirmedStateCopyWith<$Res> {
  _$ConfirmedStateCopyWithImpl(this._self, this._then);

  final ConfirmedState _self;
  final $Res Function(ConfirmedState) _then;

/// Create a copy of OrderItemsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? table = null,}) {
  return _then(ConfirmedState(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as TableEntity,
  ));
}

/// Create a copy of OrderItemsState
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
