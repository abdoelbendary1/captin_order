// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_menu_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminMenuItemEntity {

 String get id; String get categoryId; String get name; String? get description; double get price; String? get imageUrl; bool get isAvailable;
/// Create a copy of AdminMenuItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminMenuItemEntityCopyWith<AdminMenuItemEntity> get copyWith => _$AdminMenuItemEntityCopyWithImpl<AdminMenuItemEntity>(this as AdminMenuItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminMenuItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,name,description,price,imageUrl,isAvailable);

@override
String toString() {
  return 'AdminMenuItemEntity(id: $id, categoryId: $categoryId, name: $name, description: $description, price: $price, imageUrl: $imageUrl, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class $AdminMenuItemEntityCopyWith<$Res>  {
  factory $AdminMenuItemEntityCopyWith(AdminMenuItemEntity value, $Res Function(AdminMenuItemEntity) _then) = _$AdminMenuItemEntityCopyWithImpl;
@useResult
$Res call({
 String id, String categoryId, String name, String? description, double price, String? imageUrl, bool isAvailable
});




}
/// @nodoc
class _$AdminMenuItemEntityCopyWithImpl<$Res>
    implements $AdminMenuItemEntityCopyWith<$Res> {
  _$AdminMenuItemEntityCopyWithImpl(this._self, this._then);

  final AdminMenuItemEntity _self;
  final $Res Function(AdminMenuItemEntity) _then;

/// Create a copy of AdminMenuItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? name = null,Object? description = freezed,Object? price = null,Object? imageUrl = freezed,Object? isAvailable = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminMenuItemEntity].
extension AdminMenuItemEntityPatterns on AdminMenuItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminMenuItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminMenuItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminMenuItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _AdminMenuItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminMenuItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AdminMenuItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String categoryId,  String name,  String? description,  double price,  String? imageUrl,  bool isAvailable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminMenuItemEntity() when $default != null:
return $default(_that.id,_that.categoryId,_that.name,_that.description,_that.price,_that.imageUrl,_that.isAvailable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String categoryId,  String name,  String? description,  double price,  String? imageUrl,  bool isAvailable)  $default,) {final _that = this;
switch (_that) {
case _AdminMenuItemEntity():
return $default(_that.id,_that.categoryId,_that.name,_that.description,_that.price,_that.imageUrl,_that.isAvailable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String categoryId,  String name,  String? description,  double price,  String? imageUrl,  bool isAvailable)?  $default,) {final _that = this;
switch (_that) {
case _AdminMenuItemEntity() when $default != null:
return $default(_that.id,_that.categoryId,_that.name,_that.description,_that.price,_that.imageUrl,_that.isAvailable);case _:
  return null;

}
}

}

/// @nodoc


class _AdminMenuItemEntity implements AdminMenuItemEntity {
  const _AdminMenuItemEntity({required this.id, required this.categoryId, required this.name, this.description, required this.price, this.imageUrl, required this.isAvailable});
  

@override final  String id;
@override final  String categoryId;
@override final  String name;
@override final  String? description;
@override final  double price;
@override final  String? imageUrl;
@override final  bool isAvailable;

/// Create a copy of AdminMenuItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminMenuItemEntityCopyWith<_AdminMenuItemEntity> get copyWith => __$AdminMenuItemEntityCopyWithImpl<_AdminMenuItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminMenuItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,name,description,price,imageUrl,isAvailable);

@override
String toString() {
  return 'AdminMenuItemEntity(id: $id, categoryId: $categoryId, name: $name, description: $description, price: $price, imageUrl: $imageUrl, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class _$AdminMenuItemEntityCopyWith<$Res> implements $AdminMenuItemEntityCopyWith<$Res> {
  factory _$AdminMenuItemEntityCopyWith(_AdminMenuItemEntity value, $Res Function(_AdminMenuItemEntity) _then) = __$AdminMenuItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String categoryId, String name, String? description, double price, String? imageUrl, bool isAvailable
});




}
/// @nodoc
class __$AdminMenuItemEntityCopyWithImpl<$Res>
    implements _$AdminMenuItemEntityCopyWith<$Res> {
  __$AdminMenuItemEntityCopyWithImpl(this._self, this._then);

  final _AdminMenuItemEntity _self;
  final $Res Function(_AdminMenuItemEntity) _then;

/// Create a copy of AdminMenuItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? name = null,Object? description = freezed,Object? price = null,Object? imageUrl = freezed,Object? isAvailable = null,}) {
  return _then(_AdminMenuItemEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
