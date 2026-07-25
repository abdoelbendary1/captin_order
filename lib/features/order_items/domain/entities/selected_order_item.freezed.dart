// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectedOrderItem {

 MenuItemEntity get item; int get quantity;
/// Create a copy of SelectedOrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedOrderItemCopyWith<SelectedOrderItem> get copyWith => _$SelectedOrderItemCopyWithImpl<SelectedOrderItem>(this as SelectedOrderItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedOrderItem&&(identical(other.item, item) || other.item == item)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,item,quantity);

@override
String toString() {
  return 'SelectedOrderItem(item: $item, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $SelectedOrderItemCopyWith<$Res>  {
  factory $SelectedOrderItemCopyWith(SelectedOrderItem value, $Res Function(SelectedOrderItem) _then) = _$SelectedOrderItemCopyWithImpl;
@useResult
$Res call({
 MenuItemEntity item, int quantity
});


$MenuItemEntityCopyWith<$Res> get item;

}
/// @nodoc
class _$SelectedOrderItemCopyWithImpl<$Res>
    implements $SelectedOrderItemCopyWith<$Res> {
  _$SelectedOrderItemCopyWithImpl(this._self, this._then);

  final SelectedOrderItem _self;
  final $Res Function(SelectedOrderItem) _then;

/// Create a copy of SelectedOrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as MenuItemEntity,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of SelectedOrderItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemEntityCopyWith<$Res> get item {
  
  return $MenuItemEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [SelectedOrderItem].
extension SelectedOrderItemPatterns on SelectedOrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectedOrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectedOrderItem() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectedOrderItem value)  $default,){
final _that = this;
switch (_that) {
case _SelectedOrderItem():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectedOrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _SelectedOrderItem() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MenuItemEntity item,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectedOrderItem() when $default != null:
return $default(_that.item,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MenuItemEntity item,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _SelectedOrderItem():
return $default(_that.item,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MenuItemEntity item,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _SelectedOrderItem() when $default != null:
return $default(_that.item,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc


class _SelectedOrderItem implements SelectedOrderItem {
  const _SelectedOrderItem({required this.item, this.quantity = 1});
  

@override final  MenuItemEntity item;
@override@JsonKey() final  int quantity;

/// Create a copy of SelectedOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedOrderItemCopyWith<_SelectedOrderItem> get copyWith => __$SelectedOrderItemCopyWithImpl<_SelectedOrderItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedOrderItem&&(identical(other.item, item) || other.item == item)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,item,quantity);

@override
String toString() {
  return 'SelectedOrderItem(item: $item, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$SelectedOrderItemCopyWith<$Res> implements $SelectedOrderItemCopyWith<$Res> {
  factory _$SelectedOrderItemCopyWith(_SelectedOrderItem value, $Res Function(_SelectedOrderItem) _then) = __$SelectedOrderItemCopyWithImpl;
@override @useResult
$Res call({
 MenuItemEntity item, int quantity
});


@override $MenuItemEntityCopyWith<$Res> get item;

}
/// @nodoc
class __$SelectedOrderItemCopyWithImpl<$Res>
    implements _$SelectedOrderItemCopyWith<$Res> {
  __$SelectedOrderItemCopyWithImpl(this._self, this._then);

  final _SelectedOrderItem _self;
  final $Res Function(_SelectedOrderItem) _then;

/// Create a copy of SelectedOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? quantity = null,}) {
  return _then(_SelectedOrderItem(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as MenuItemEntity,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of SelectedOrderItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemEntityCopyWith<$Res> get item {
  
  return $MenuItemEntityCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

// dart format on
