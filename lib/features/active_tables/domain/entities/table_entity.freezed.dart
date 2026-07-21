// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TableEntity {

 String get id; String get tableNumber; TableStatus get status; int get guestCount; double get currentTotal; DateTime get seatedAt; List<OrderItem> get items; String? get assignedCaptain; String? get areaName;
/// Create a copy of TableEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableEntityCopyWith<TableEntity> get copyWith => _$TableEntityCopyWithImpl<TableEntity>(this as TableEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.guestCount, guestCount) || other.guestCount == guestCount)&&(identical(other.currentTotal, currentTotal) || other.currentTotal == currentTotal)&&(identical(other.seatedAt, seatedAt) || other.seatedAt == seatedAt)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.assignedCaptain, assignedCaptain) || other.assignedCaptain == assignedCaptain)&&(identical(other.areaName, areaName) || other.areaName == areaName));
}


@override
int get hashCode => Object.hash(runtimeType,id,tableNumber,status,guestCount,currentTotal,seatedAt,const DeepCollectionEquality().hash(items),assignedCaptain,areaName);

@override
String toString() {
  return 'TableEntity(id: $id, tableNumber: $tableNumber, status: $status, guestCount: $guestCount, currentTotal: $currentTotal, seatedAt: $seatedAt, items: $items, assignedCaptain: $assignedCaptain, areaName: $areaName)';
}


}

/// @nodoc
abstract mixin class $TableEntityCopyWith<$Res>  {
  factory $TableEntityCopyWith(TableEntity value, $Res Function(TableEntity) _then) = _$TableEntityCopyWithImpl;
@useResult
$Res call({
 String id, String tableNumber, TableStatus status, int guestCount, double currentTotal, DateTime seatedAt, List<OrderItem> items, String? assignedCaptain, String? areaName
});




}
/// @nodoc
class _$TableEntityCopyWithImpl<$Res>
    implements $TableEntityCopyWith<$Res> {
  _$TableEntityCopyWithImpl(this._self, this._then);

  final TableEntity _self;
  final $Res Function(TableEntity) _then;

/// Create a copy of TableEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tableNumber = null,Object? status = null,Object? guestCount = null,Object? currentTotal = null,Object? seatedAt = null,Object? items = null,Object? assignedCaptain = freezed,Object? areaName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TableStatus,guestCount: null == guestCount ? _self.guestCount : guestCount // ignore: cast_nullable_to_non_nullable
as int,currentTotal: null == currentTotal ? _self.currentTotal : currentTotal // ignore: cast_nullable_to_non_nullable
as double,seatedAt: null == seatedAt ? _self.seatedAt : seatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,assignedCaptain: freezed == assignedCaptain ? _self.assignedCaptain : assignedCaptain // ignore: cast_nullable_to_non_nullable
as String?,areaName: freezed == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TableEntity].
extension TableEntityPatterns on TableEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TableEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TableEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TableEntity value)  $default,){
final _that = this;
switch (_that) {
case _TableEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TableEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TableEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tableNumber,  TableStatus status,  int guestCount,  double currentTotal,  DateTime seatedAt,  List<OrderItem> items,  String? assignedCaptain,  String? areaName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TableEntity() when $default != null:
return $default(_that.id,_that.tableNumber,_that.status,_that.guestCount,_that.currentTotal,_that.seatedAt,_that.items,_that.assignedCaptain,_that.areaName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tableNumber,  TableStatus status,  int guestCount,  double currentTotal,  DateTime seatedAt,  List<OrderItem> items,  String? assignedCaptain,  String? areaName)  $default,) {final _that = this;
switch (_that) {
case _TableEntity():
return $default(_that.id,_that.tableNumber,_that.status,_that.guestCount,_that.currentTotal,_that.seatedAt,_that.items,_that.assignedCaptain,_that.areaName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tableNumber,  TableStatus status,  int guestCount,  double currentTotal,  DateTime seatedAt,  List<OrderItem> items,  String? assignedCaptain,  String? areaName)?  $default,) {final _that = this;
switch (_that) {
case _TableEntity() when $default != null:
return $default(_that.id,_that.tableNumber,_that.status,_that.guestCount,_that.currentTotal,_that.seatedAt,_that.items,_that.assignedCaptain,_that.areaName);case _:
  return null;

}
}

}

/// @nodoc


class _TableEntity implements TableEntity {
  const _TableEntity({required this.id, required this.tableNumber, required this.status, required this.guestCount, required this.currentTotal, required this.seatedAt, required final  List<OrderItem> items, this.assignedCaptain, this.areaName}): _items = items;
  

@override final  String id;
@override final  String tableNumber;
@override final  TableStatus status;
@override final  int guestCount;
@override final  double currentTotal;
@override final  DateTime seatedAt;
 final  List<OrderItem> _items;
@override List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? assignedCaptain;
@override final  String? areaName;

/// Create a copy of TableEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TableEntityCopyWith<_TableEntity> get copyWith => __$TableEntityCopyWithImpl<_TableEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TableEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.guestCount, guestCount) || other.guestCount == guestCount)&&(identical(other.currentTotal, currentTotal) || other.currentTotal == currentTotal)&&(identical(other.seatedAt, seatedAt) || other.seatedAt == seatedAt)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.assignedCaptain, assignedCaptain) || other.assignedCaptain == assignedCaptain)&&(identical(other.areaName, areaName) || other.areaName == areaName));
}


@override
int get hashCode => Object.hash(runtimeType,id,tableNumber,status,guestCount,currentTotal,seatedAt,const DeepCollectionEquality().hash(_items),assignedCaptain,areaName);

@override
String toString() {
  return 'TableEntity(id: $id, tableNumber: $tableNumber, status: $status, guestCount: $guestCount, currentTotal: $currentTotal, seatedAt: $seatedAt, items: $items, assignedCaptain: $assignedCaptain, areaName: $areaName)';
}


}

/// @nodoc
abstract mixin class _$TableEntityCopyWith<$Res> implements $TableEntityCopyWith<$Res> {
  factory _$TableEntityCopyWith(_TableEntity value, $Res Function(_TableEntity) _then) = __$TableEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String tableNumber, TableStatus status, int guestCount, double currentTotal, DateTime seatedAt, List<OrderItem> items, String? assignedCaptain, String? areaName
});




}
/// @nodoc
class __$TableEntityCopyWithImpl<$Res>
    implements _$TableEntityCopyWith<$Res> {
  __$TableEntityCopyWithImpl(this._self, this._then);

  final _TableEntity _self;
  final $Res Function(_TableEntity) _then;

/// Create a copy of TableEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tableNumber = null,Object? status = null,Object? guestCount = null,Object? currentTotal = null,Object? seatedAt = null,Object? items = null,Object? assignedCaptain = freezed,Object? areaName = freezed,}) {
  return _then(_TableEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TableStatus,guestCount: null == guestCount ? _self.guestCount : guestCount // ignore: cast_nullable_to_non_nullable
as int,currentTotal: null == currentTotal ? _self.currentTotal : currentTotal // ignore: cast_nullable_to_non_nullable
as double,seatedAt: null == seatedAt ? _self.seatedAt : seatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,assignedCaptain: freezed == assignedCaptain ? _self.assignedCaptain : assignedCaptain // ignore: cast_nullable_to_non_nullable
as String?,areaName: freezed == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
