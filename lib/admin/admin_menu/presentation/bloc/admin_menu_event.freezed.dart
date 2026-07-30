// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_menu_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminMenuEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminMenuEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminMenuEvent()';
}


}

/// @nodoc
class $AdminMenuEventCopyWith<$Res>  {
$AdminMenuEventCopyWith(AdminMenuEvent _, $Res Function(AdminMenuEvent) __);
}


/// Adds pattern-matching-related methods to [AdminMenuEvent].
extension AdminMenuEventPatterns on AdminMenuEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadMenu value)?  loadMenu,TResult Function( _SelectCategory value)?  selectCategory,TResult Function( _CreateItem value)?  createItem,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadMenu() when loadMenu != null:
return loadMenu(_that);case _SelectCategory() when selectCategory != null:
return selectCategory(_that);case _CreateItem() when createItem != null:
return createItem(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadMenu value)  loadMenu,required TResult Function( _SelectCategory value)  selectCategory,required TResult Function( _CreateItem value)  createItem,}){
final _that = this;
switch (_that) {
case _LoadMenu():
return loadMenu(_that);case _SelectCategory():
return selectCategory(_that);case _CreateItem():
return createItem(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadMenu value)?  loadMenu,TResult? Function( _SelectCategory value)?  selectCategory,TResult? Function( _CreateItem value)?  createItem,}){
final _that = this;
switch (_that) {
case _LoadMenu() when loadMenu != null:
return loadMenu(_that);case _SelectCategory() when selectCategory != null:
return selectCategory(_that);case _CreateItem() when createItem != null:
return createItem(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? categoryId)?  loadMenu,TResult Function( String categoryId)?  selectCategory,TResult Function( AdminMenuItemEntity item)?  createItem,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadMenu() when loadMenu != null:
return loadMenu(_that.categoryId);case _SelectCategory() when selectCategory != null:
return selectCategory(_that.categoryId);case _CreateItem() when createItem != null:
return createItem(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? categoryId)  loadMenu,required TResult Function( String categoryId)  selectCategory,required TResult Function( AdminMenuItemEntity item)  createItem,}) {final _that = this;
switch (_that) {
case _LoadMenu():
return loadMenu(_that.categoryId);case _SelectCategory():
return selectCategory(_that.categoryId);case _CreateItem():
return createItem(_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? categoryId)?  loadMenu,TResult? Function( String categoryId)?  selectCategory,TResult? Function( AdminMenuItemEntity item)?  createItem,}) {final _that = this;
switch (_that) {
case _LoadMenu() when loadMenu != null:
return loadMenu(_that.categoryId);case _SelectCategory() when selectCategory != null:
return selectCategory(_that.categoryId);case _CreateItem() when createItem != null:
return createItem(_that.item);case _:
  return null;

}
}

}

/// @nodoc


class _LoadMenu implements AdminMenuEvent {
  const _LoadMenu({this.categoryId});
  

 final  String? categoryId;

/// Create a copy of AdminMenuEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadMenuCopyWith<_LoadMenu> get copyWith => __$LoadMenuCopyWithImpl<_LoadMenu>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadMenu&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'AdminMenuEvent.loadMenu(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$LoadMenuCopyWith<$Res> implements $AdminMenuEventCopyWith<$Res> {
  factory _$LoadMenuCopyWith(_LoadMenu value, $Res Function(_LoadMenu) _then) = __$LoadMenuCopyWithImpl;
@useResult
$Res call({
 String? categoryId
});




}
/// @nodoc
class __$LoadMenuCopyWithImpl<$Res>
    implements _$LoadMenuCopyWith<$Res> {
  __$LoadMenuCopyWithImpl(this._self, this._then);

  final _LoadMenu _self;
  final $Res Function(_LoadMenu) _then;

/// Create a copy of AdminMenuEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,}) {
  return _then(_LoadMenu(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _SelectCategory implements AdminMenuEvent {
  const _SelectCategory({required this.categoryId});
  

 final  String categoryId;

/// Create a copy of AdminMenuEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectCategoryCopyWith<_SelectCategory> get copyWith => __$SelectCategoryCopyWithImpl<_SelectCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectCategory&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'AdminMenuEvent.selectCategory(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$SelectCategoryCopyWith<$Res> implements $AdminMenuEventCopyWith<$Res> {
  factory _$SelectCategoryCopyWith(_SelectCategory value, $Res Function(_SelectCategory) _then) = __$SelectCategoryCopyWithImpl;
@useResult
$Res call({
 String categoryId
});




}
/// @nodoc
class __$SelectCategoryCopyWithImpl<$Res>
    implements _$SelectCategoryCopyWith<$Res> {
  __$SelectCategoryCopyWithImpl(this._self, this._then);

  final _SelectCategory _self;
  final $Res Function(_SelectCategory) _then;

/// Create a copy of AdminMenuEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(_SelectCategory(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CreateItem implements AdminMenuEvent {
  const _CreateItem({required this.item});
  

 final  AdminMenuItemEntity item;

/// Create a copy of AdminMenuEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateItemCopyWith<_CreateItem> get copyWith => __$CreateItemCopyWithImpl<_CreateItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateItem&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'AdminMenuEvent.createItem(item: $item)';
}


}

/// @nodoc
abstract mixin class _$CreateItemCopyWith<$Res> implements $AdminMenuEventCopyWith<$Res> {
  factory _$CreateItemCopyWith(_CreateItem value, $Res Function(_CreateItem) _then) = __$CreateItemCopyWithImpl;
@useResult
$Res call({
 AdminMenuItemEntity item
});


$AdminMenuItemEntityCopyWith<$Res> get item;

}
/// @nodoc
class __$CreateItemCopyWithImpl<$Res>
    implements _$CreateItemCopyWith<$Res> {
  __$CreateItemCopyWithImpl(this._self, this._then);

  final _CreateItem _self;
  final $Res Function(_CreateItem) _then;

/// Create a copy of AdminMenuEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_CreateItem(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as AdminMenuItemEntity,
  ));
}

/// Create a copy of AdminMenuEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminMenuItemEntityCopyWith<$Res> get item {
  
  return $AdminMenuItemEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

// dart format on
