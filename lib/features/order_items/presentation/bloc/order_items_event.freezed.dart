// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_items_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderItemsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderItemsEvent()';
}


}

/// @nodoc
class $OrderItemsEventCopyWith<$Res>  {
$OrderItemsEventCopyWith(OrderItemsEvent _, $Res Function(OrderItemsEvent) __);
}


/// Adds pattern-matching-related methods to [OrderItemsEvent].
extension OrderItemsEventPatterns on OrderItemsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadMenuItemsEvent value)?  loadMenuItems,TResult Function( SelectCategoryEvent value)?  selectCategory,TResult Function( SearchItemsEvent value)?  searchItems,TResult Function( IncrementItemEvent value)?  incrementItem,TResult Function( DecrementItemEvent value)?  decrementItem,TResult Function( RemoveItemEvent value)?  removeItem,TResult Function( ConfirmOrderEvent value)?  confirmOrder,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadMenuItemsEvent() when loadMenuItems != null:
return loadMenuItems(_that);case SelectCategoryEvent() when selectCategory != null:
return selectCategory(_that);case SearchItemsEvent() when searchItems != null:
return searchItems(_that);case IncrementItemEvent() when incrementItem != null:
return incrementItem(_that);case DecrementItemEvent() when decrementItem != null:
return decrementItem(_that);case RemoveItemEvent() when removeItem != null:
return removeItem(_that);case ConfirmOrderEvent() when confirmOrder != null:
return confirmOrder(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadMenuItemsEvent value)  loadMenuItems,required TResult Function( SelectCategoryEvent value)  selectCategory,required TResult Function( SearchItemsEvent value)  searchItems,required TResult Function( IncrementItemEvent value)  incrementItem,required TResult Function( DecrementItemEvent value)  decrementItem,required TResult Function( RemoveItemEvent value)  removeItem,required TResult Function( ConfirmOrderEvent value)  confirmOrder,}){
final _that = this;
switch (_that) {
case LoadMenuItemsEvent():
return loadMenuItems(_that);case SelectCategoryEvent():
return selectCategory(_that);case SearchItemsEvent():
return searchItems(_that);case IncrementItemEvent():
return incrementItem(_that);case DecrementItemEvent():
return decrementItem(_that);case RemoveItemEvent():
return removeItem(_that);case ConfirmOrderEvent():
return confirmOrder(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadMenuItemsEvent value)?  loadMenuItems,TResult? Function( SelectCategoryEvent value)?  selectCategory,TResult? Function( SearchItemsEvent value)?  searchItems,TResult? Function( IncrementItemEvent value)?  incrementItem,TResult? Function( DecrementItemEvent value)?  decrementItem,TResult? Function( RemoveItemEvent value)?  removeItem,TResult? Function( ConfirmOrderEvent value)?  confirmOrder,}){
final _that = this;
switch (_that) {
case LoadMenuItemsEvent() when loadMenuItems != null:
return loadMenuItems(_that);case SelectCategoryEvent() when selectCategory != null:
return selectCategory(_that);case SearchItemsEvent() when searchItems != null:
return searchItems(_that);case IncrementItemEvent() when incrementItem != null:
return incrementItem(_that);case DecrementItemEvent() when decrementItem != null:
return decrementItem(_that);case RemoveItemEvent() when removeItem != null:
return removeItem(_that);case ConfirmOrderEvent() when confirmOrder != null:
return confirmOrder(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? tableNumber)?  loadMenuItems,TResult Function( String category)?  selectCategory,TResult Function( String query)?  searchItems,TResult Function( MenuItemEntity item)?  incrementItem,TResult Function( MenuItemEntity item)?  decrementItem,TResult Function( MenuItemEntity item)?  removeItem,TResult Function( String tableNumber,  String areaName)?  confirmOrder,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadMenuItemsEvent() when loadMenuItems != null:
return loadMenuItems(_that.tableNumber);case SelectCategoryEvent() when selectCategory != null:
return selectCategory(_that.category);case SearchItemsEvent() when searchItems != null:
return searchItems(_that.query);case IncrementItemEvent() when incrementItem != null:
return incrementItem(_that.item);case DecrementItemEvent() when decrementItem != null:
return decrementItem(_that.item);case RemoveItemEvent() when removeItem != null:
return removeItem(_that.item);case ConfirmOrderEvent() when confirmOrder != null:
return confirmOrder(_that.tableNumber,_that.areaName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? tableNumber)  loadMenuItems,required TResult Function( String category)  selectCategory,required TResult Function( String query)  searchItems,required TResult Function( MenuItemEntity item)  incrementItem,required TResult Function( MenuItemEntity item)  decrementItem,required TResult Function( MenuItemEntity item)  removeItem,required TResult Function( String tableNumber,  String areaName)  confirmOrder,}) {final _that = this;
switch (_that) {
case LoadMenuItemsEvent():
return loadMenuItems(_that.tableNumber);case SelectCategoryEvent():
return selectCategory(_that.category);case SearchItemsEvent():
return searchItems(_that.query);case IncrementItemEvent():
return incrementItem(_that.item);case DecrementItemEvent():
return decrementItem(_that.item);case RemoveItemEvent():
return removeItem(_that.item);case ConfirmOrderEvent():
return confirmOrder(_that.tableNumber,_that.areaName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? tableNumber)?  loadMenuItems,TResult? Function( String category)?  selectCategory,TResult? Function( String query)?  searchItems,TResult? Function( MenuItemEntity item)?  incrementItem,TResult? Function( MenuItemEntity item)?  decrementItem,TResult? Function( MenuItemEntity item)?  removeItem,TResult? Function( String tableNumber,  String areaName)?  confirmOrder,}) {final _that = this;
switch (_that) {
case LoadMenuItemsEvent() when loadMenuItems != null:
return loadMenuItems(_that.tableNumber);case SelectCategoryEvent() when selectCategory != null:
return selectCategory(_that.category);case SearchItemsEvent() when searchItems != null:
return searchItems(_that.query);case IncrementItemEvent() when incrementItem != null:
return incrementItem(_that.item);case DecrementItemEvent() when decrementItem != null:
return decrementItem(_that.item);case RemoveItemEvent() when removeItem != null:
return removeItem(_that.item);case ConfirmOrderEvent() when confirmOrder != null:
return confirmOrder(_that.tableNumber,_that.areaName);case _:
  return null;

}
}

}

/// @nodoc


class LoadMenuItemsEvent implements OrderItemsEvent {
  const LoadMenuItemsEvent({this.tableNumber});
  

 final  String? tableNumber;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadMenuItemsEventCopyWith<LoadMenuItemsEvent> get copyWith => _$LoadMenuItemsEventCopyWithImpl<LoadMenuItemsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMenuItemsEvent&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber));
}


@override
int get hashCode => Object.hash(runtimeType,tableNumber);

@override
String toString() {
  return 'OrderItemsEvent.loadMenuItems(tableNumber: $tableNumber)';
}


}

/// @nodoc
abstract mixin class $LoadMenuItemsEventCopyWith<$Res> implements $OrderItemsEventCopyWith<$Res> {
  factory $LoadMenuItemsEventCopyWith(LoadMenuItemsEvent value, $Res Function(LoadMenuItemsEvent) _then) = _$LoadMenuItemsEventCopyWithImpl;
@useResult
$Res call({
 String? tableNumber
});




}
/// @nodoc
class _$LoadMenuItemsEventCopyWithImpl<$Res>
    implements $LoadMenuItemsEventCopyWith<$Res> {
  _$LoadMenuItemsEventCopyWithImpl(this._self, this._then);

  final LoadMenuItemsEvent _self;
  final $Res Function(LoadMenuItemsEvent) _then;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableNumber = freezed,}) {
  return _then(LoadMenuItemsEvent(
tableNumber: freezed == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SelectCategoryEvent implements OrderItemsEvent {
  const SelectCategoryEvent({required this.category});
  

 final  String category;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectCategoryEventCopyWith<SelectCategoryEvent> get copyWith => _$SelectCategoryEventCopyWithImpl<SelectCategoryEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectCategoryEvent&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'OrderItemsEvent.selectCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class $SelectCategoryEventCopyWith<$Res> implements $OrderItemsEventCopyWith<$Res> {
  factory $SelectCategoryEventCopyWith(SelectCategoryEvent value, $Res Function(SelectCategoryEvent) _then) = _$SelectCategoryEventCopyWithImpl;
@useResult
$Res call({
 String category
});




}
/// @nodoc
class _$SelectCategoryEventCopyWithImpl<$Res>
    implements $SelectCategoryEventCopyWith<$Res> {
  _$SelectCategoryEventCopyWithImpl(this._self, this._then);

  final SelectCategoryEvent _self;
  final $Res Function(SelectCategoryEvent) _then;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(SelectCategoryEvent(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SearchItemsEvent implements OrderItemsEvent {
  const SearchItemsEvent({required this.query});
  

 final  String query;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchItemsEventCopyWith<SearchItemsEvent> get copyWith => _$SearchItemsEventCopyWithImpl<SearchItemsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchItemsEvent&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'OrderItemsEvent.searchItems(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchItemsEventCopyWith<$Res> implements $OrderItemsEventCopyWith<$Res> {
  factory $SearchItemsEventCopyWith(SearchItemsEvent value, $Res Function(SearchItemsEvent) _then) = _$SearchItemsEventCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchItemsEventCopyWithImpl<$Res>
    implements $SearchItemsEventCopyWith<$Res> {
  _$SearchItemsEventCopyWithImpl(this._self, this._then);

  final SearchItemsEvent _self;
  final $Res Function(SearchItemsEvent) _then;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchItemsEvent(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class IncrementItemEvent implements OrderItemsEvent {
  const IncrementItemEvent({required this.item});
  

 final  MenuItemEntity item;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncrementItemEventCopyWith<IncrementItemEvent> get copyWith => _$IncrementItemEventCopyWithImpl<IncrementItemEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncrementItemEvent&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'OrderItemsEvent.incrementItem(item: $item)';
}


}

/// @nodoc
abstract mixin class $IncrementItemEventCopyWith<$Res> implements $OrderItemsEventCopyWith<$Res> {
  factory $IncrementItemEventCopyWith(IncrementItemEvent value, $Res Function(IncrementItemEvent) _then) = _$IncrementItemEventCopyWithImpl;
@useResult
$Res call({
 MenuItemEntity item
});


$MenuItemEntityCopyWith<$Res> get item;

}
/// @nodoc
class _$IncrementItemEventCopyWithImpl<$Res>
    implements $IncrementItemEventCopyWith<$Res> {
  _$IncrementItemEventCopyWithImpl(this._self, this._then);

  final IncrementItemEvent _self;
  final $Res Function(IncrementItemEvent) _then;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(IncrementItemEvent(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as MenuItemEntity,
  ));
}

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemEntityCopyWith<$Res> get item {
  
  return $MenuItemEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class DecrementItemEvent implements OrderItemsEvent {
  const DecrementItemEvent({required this.item});
  

 final  MenuItemEntity item;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecrementItemEventCopyWith<DecrementItemEvent> get copyWith => _$DecrementItemEventCopyWithImpl<DecrementItemEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecrementItemEvent&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'OrderItemsEvent.decrementItem(item: $item)';
}


}

/// @nodoc
abstract mixin class $DecrementItemEventCopyWith<$Res> implements $OrderItemsEventCopyWith<$Res> {
  factory $DecrementItemEventCopyWith(DecrementItemEvent value, $Res Function(DecrementItemEvent) _then) = _$DecrementItemEventCopyWithImpl;
@useResult
$Res call({
 MenuItemEntity item
});


$MenuItemEntityCopyWith<$Res> get item;

}
/// @nodoc
class _$DecrementItemEventCopyWithImpl<$Res>
    implements $DecrementItemEventCopyWith<$Res> {
  _$DecrementItemEventCopyWithImpl(this._self, this._then);

  final DecrementItemEvent _self;
  final $Res Function(DecrementItemEvent) _then;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(DecrementItemEvent(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as MenuItemEntity,
  ));
}

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemEntityCopyWith<$Res> get item {
  
  return $MenuItemEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class RemoveItemEvent implements OrderItemsEvent {
  const RemoveItemEvent({required this.item});
  

 final  MenuItemEntity item;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveItemEventCopyWith<RemoveItemEvent> get copyWith => _$RemoveItemEventCopyWithImpl<RemoveItemEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveItemEvent&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'OrderItemsEvent.removeItem(item: $item)';
}


}

/// @nodoc
abstract mixin class $RemoveItemEventCopyWith<$Res> implements $OrderItemsEventCopyWith<$Res> {
  factory $RemoveItemEventCopyWith(RemoveItemEvent value, $Res Function(RemoveItemEvent) _then) = _$RemoveItemEventCopyWithImpl;
@useResult
$Res call({
 MenuItemEntity item
});


$MenuItemEntityCopyWith<$Res> get item;

}
/// @nodoc
class _$RemoveItemEventCopyWithImpl<$Res>
    implements $RemoveItemEventCopyWith<$Res> {
  _$RemoveItemEventCopyWithImpl(this._self, this._then);

  final RemoveItemEvent _self;
  final $Res Function(RemoveItemEvent) _then;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(RemoveItemEvent(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as MenuItemEntity,
  ));
}

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemEntityCopyWith<$Res> get item {
  
  return $MenuItemEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class ConfirmOrderEvent implements OrderItemsEvent {
  const ConfirmOrderEvent({required this.tableNumber, required this.areaName});
  

 final  String tableNumber;
 final  String areaName;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmOrderEventCopyWith<ConfirmOrderEvent> get copyWith => _$ConfirmOrderEventCopyWithImpl<ConfirmOrderEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmOrderEvent&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.areaName, areaName) || other.areaName == areaName));
}


@override
int get hashCode => Object.hash(runtimeType,tableNumber,areaName);

@override
String toString() {
  return 'OrderItemsEvent.confirmOrder(tableNumber: $tableNumber, areaName: $areaName)';
}


}

/// @nodoc
abstract mixin class $ConfirmOrderEventCopyWith<$Res> implements $OrderItemsEventCopyWith<$Res> {
  factory $ConfirmOrderEventCopyWith(ConfirmOrderEvent value, $Res Function(ConfirmOrderEvent) _then) = _$ConfirmOrderEventCopyWithImpl;
@useResult
$Res call({
 String tableNumber, String areaName
});




}
/// @nodoc
class _$ConfirmOrderEventCopyWithImpl<$Res>
    implements $ConfirmOrderEventCopyWith<$Res> {
  _$ConfirmOrderEventCopyWithImpl(this._self, this._then);

  final ConfirmOrderEvent _self;
  final $Res Function(ConfirmOrderEvent) _then;

/// Create a copy of OrderItemsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableNumber = null,Object? areaName = null,}) {
  return _then(ConfirmOrderEvent(
tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
