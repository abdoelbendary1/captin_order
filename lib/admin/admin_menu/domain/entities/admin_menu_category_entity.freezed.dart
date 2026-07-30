// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_menu_category_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminMenuCategoryEntity {

 String get id; String get name; int get displayOrder;
/// Create a copy of AdminMenuCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminMenuCategoryEntityCopyWith<AdminMenuCategoryEntity> get copyWith => _$AdminMenuCategoryEntityCopyWithImpl<AdminMenuCategoryEntity>(this as AdminMenuCategoryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminMenuCategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,displayOrder);

@override
String toString() {
  return 'AdminMenuCategoryEntity(id: $id, name: $name, displayOrder: $displayOrder)';
}


}

/// @nodoc
abstract mixin class $AdminMenuCategoryEntityCopyWith<$Res>  {
  factory $AdminMenuCategoryEntityCopyWith(AdminMenuCategoryEntity value, $Res Function(AdminMenuCategoryEntity) _then) = _$AdminMenuCategoryEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, int displayOrder
});




}
/// @nodoc
class _$AdminMenuCategoryEntityCopyWithImpl<$Res>
    implements $AdminMenuCategoryEntityCopyWith<$Res> {
  _$AdminMenuCategoryEntityCopyWithImpl(this._self, this._then);

  final AdminMenuCategoryEntity _self;
  final $Res Function(AdminMenuCategoryEntity) _then;

/// Create a copy of AdminMenuCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? displayOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminMenuCategoryEntity].
extension AdminMenuCategoryEntityPatterns on AdminMenuCategoryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminMenuCategoryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminMenuCategoryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminMenuCategoryEntity value)  $default,){
final _that = this;
switch (_that) {
case _AdminMenuCategoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminMenuCategoryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AdminMenuCategoryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int displayOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminMenuCategoryEntity() when $default != null:
return $default(_that.id,_that.name,_that.displayOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int displayOrder)  $default,) {final _that = this;
switch (_that) {
case _AdminMenuCategoryEntity():
return $default(_that.id,_that.name,_that.displayOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int displayOrder)?  $default,) {final _that = this;
switch (_that) {
case _AdminMenuCategoryEntity() when $default != null:
return $default(_that.id,_that.name,_that.displayOrder);case _:
  return null;

}
}

}

/// @nodoc


class _AdminMenuCategoryEntity implements AdminMenuCategoryEntity {
  const _AdminMenuCategoryEntity({required this.id, required this.name, required this.displayOrder});
  

@override final  String id;
@override final  String name;
@override final  int displayOrder;

/// Create a copy of AdminMenuCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminMenuCategoryEntityCopyWith<_AdminMenuCategoryEntity> get copyWith => __$AdminMenuCategoryEntityCopyWithImpl<_AdminMenuCategoryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminMenuCategoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,displayOrder);

@override
String toString() {
  return 'AdminMenuCategoryEntity(id: $id, name: $name, displayOrder: $displayOrder)';
}


}

/// @nodoc
abstract mixin class _$AdminMenuCategoryEntityCopyWith<$Res> implements $AdminMenuCategoryEntityCopyWith<$Res> {
  factory _$AdminMenuCategoryEntityCopyWith(_AdminMenuCategoryEntity value, $Res Function(_AdminMenuCategoryEntity) _then) = __$AdminMenuCategoryEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int displayOrder
});




}
/// @nodoc
class __$AdminMenuCategoryEntityCopyWithImpl<$Res>
    implements _$AdminMenuCategoryEntityCopyWith<$Res> {
  __$AdminMenuCategoryEntityCopyWithImpl(this._self, this._then);

  final _AdminMenuCategoryEntity _self;
  final $Res Function(_AdminMenuCategoryEntity) _then;

/// Create a copy of AdminMenuCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? displayOrder = null,}) {
  return _then(_AdminMenuCategoryEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
