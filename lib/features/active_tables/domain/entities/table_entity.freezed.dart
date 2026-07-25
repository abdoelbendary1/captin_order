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

 String get id; String get tableNumber; String get tableCode; TableStatus get status; TableLocation get location; int get guestCount; double get currentTotal; String get timeSeated; String get areaName; DateTime? get openedAt; DateTime? get seatedAt; List<OrderItem> get items; List<TimelineEvent> get timeline; String? get tableStatusDescription; String? get assignedCaptain; int get capacity; String? get notes;
/// Create a copy of TableEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableEntityCopyWith<TableEntity> get copyWith => _$TableEntityCopyWithImpl<TableEntity>(this as TableEntity, _$identity);

  /// Serializes this TableEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.tableCode, tableCode) || other.tableCode == tableCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.location, location) || other.location == location)&&(identical(other.guestCount, guestCount) || other.guestCount == guestCount)&&(identical(other.currentTotal, currentTotal) || other.currentTotal == currentTotal)&&(identical(other.timeSeated, timeSeated) || other.timeSeated == timeSeated)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.openedAt, openedAt) || other.openedAt == openedAt)&&(identical(other.seatedAt, seatedAt) || other.seatedAt == seatedAt)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.timeline, timeline)&&(identical(other.tableStatusDescription, tableStatusDescription) || other.tableStatusDescription == tableStatusDescription)&&(identical(other.assignedCaptain, assignedCaptain) || other.assignedCaptain == assignedCaptain)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tableNumber,tableCode,status,location,guestCount,currentTotal,timeSeated,areaName,openedAt,seatedAt,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(timeline),tableStatusDescription,assignedCaptain,capacity,notes);

@override
String toString() {
  return 'TableEntity(id: $id, tableNumber: $tableNumber, tableCode: $tableCode, status: $status, location: $location, guestCount: $guestCount, currentTotal: $currentTotal, timeSeated: $timeSeated, areaName: $areaName, openedAt: $openedAt, seatedAt: $seatedAt, items: $items, timeline: $timeline, tableStatusDescription: $tableStatusDescription, assignedCaptain: $assignedCaptain, capacity: $capacity, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $TableEntityCopyWith<$Res>  {
  factory $TableEntityCopyWith(TableEntity value, $Res Function(TableEntity) _then) = _$TableEntityCopyWithImpl;
@useResult
$Res call({
 String id, String tableNumber, String tableCode, TableStatus status, TableLocation location, int guestCount, double currentTotal, String timeSeated, String areaName, DateTime? openedAt, DateTime? seatedAt, List<OrderItem> items, List<TimelineEvent> timeline, String? tableStatusDescription, String? assignedCaptain, int capacity, String? notes
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tableNumber = null,Object? tableCode = null,Object? status = null,Object? location = null,Object? guestCount = null,Object? currentTotal = null,Object? timeSeated = null,Object? areaName = null,Object? openedAt = freezed,Object? seatedAt = freezed,Object? items = null,Object? timeline = null,Object? tableStatusDescription = freezed,Object? assignedCaptain = freezed,Object? capacity = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,tableCode: null == tableCode ? _self.tableCode : tableCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TableStatus,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as TableLocation,guestCount: null == guestCount ? _self.guestCount : guestCount // ignore: cast_nullable_to_non_nullable
as int,currentTotal: null == currentTotal ? _self.currentTotal : currentTotal // ignore: cast_nullable_to_non_nullable
as double,timeSeated: null == timeSeated ? _self.timeSeated : timeSeated // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,openedAt: freezed == openedAt ? _self.openedAt : openedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,seatedAt: freezed == seatedAt ? _self.seatedAt : seatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<TimelineEvent>,tableStatusDescription: freezed == tableStatusDescription ? _self.tableStatusDescription : tableStatusDescription // ignore: cast_nullable_to_non_nullable
as String?,assignedCaptain: freezed == assignedCaptain ? _self.assignedCaptain : assignedCaptain // ignore: cast_nullable_to_non_nullable
as String?,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tableNumber,  String tableCode,  TableStatus status,  TableLocation location,  int guestCount,  double currentTotal,  String timeSeated,  String areaName,  DateTime? openedAt,  DateTime? seatedAt,  List<OrderItem> items,  List<TimelineEvent> timeline,  String? tableStatusDescription,  String? assignedCaptain,  int capacity,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TableEntity() when $default != null:
return $default(_that.id,_that.tableNumber,_that.tableCode,_that.status,_that.location,_that.guestCount,_that.currentTotal,_that.timeSeated,_that.areaName,_that.openedAt,_that.seatedAt,_that.items,_that.timeline,_that.tableStatusDescription,_that.assignedCaptain,_that.capacity,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tableNumber,  String tableCode,  TableStatus status,  TableLocation location,  int guestCount,  double currentTotal,  String timeSeated,  String areaName,  DateTime? openedAt,  DateTime? seatedAt,  List<OrderItem> items,  List<TimelineEvent> timeline,  String? tableStatusDescription,  String? assignedCaptain,  int capacity,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _TableEntity():
return $default(_that.id,_that.tableNumber,_that.tableCode,_that.status,_that.location,_that.guestCount,_that.currentTotal,_that.timeSeated,_that.areaName,_that.openedAt,_that.seatedAt,_that.items,_that.timeline,_that.tableStatusDescription,_that.assignedCaptain,_that.capacity,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tableNumber,  String tableCode,  TableStatus status,  TableLocation location,  int guestCount,  double currentTotal,  String timeSeated,  String areaName,  DateTime? openedAt,  DateTime? seatedAt,  List<OrderItem> items,  List<TimelineEvent> timeline,  String? tableStatusDescription,  String? assignedCaptain,  int capacity,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _TableEntity() when $default != null:
return $default(_that.id,_that.tableNumber,_that.tableCode,_that.status,_that.location,_that.guestCount,_that.currentTotal,_that.timeSeated,_that.areaName,_that.openedAt,_that.seatedAt,_that.items,_that.timeline,_that.tableStatusDescription,_that.assignedCaptain,_that.capacity,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TableEntity implements TableEntity {
  const _TableEntity({required this.id, required this.tableNumber, this.tableCode = 'T-00', required this.status, this.location = TableLocation.inside, required this.guestCount, required this.currentTotal, this.timeSeated = '00:00', required this.areaName, this.openedAt, this.seatedAt, final  List<OrderItem> items = const [], final  List<TimelineEvent> timeline = const [], this.tableStatusDescription, this.assignedCaptain, this.capacity = 4, this.notes}): _items = items,_timeline = timeline;
  factory _TableEntity.fromJson(Map<String, dynamic> json) => _$TableEntityFromJson(json);

@override final  String id;
@override final  String tableNumber;
@override@JsonKey() final  String tableCode;
@override final  TableStatus status;
@override@JsonKey() final  TableLocation location;
@override final  int guestCount;
@override final  double currentTotal;
@override@JsonKey() final  String timeSeated;
@override final  String areaName;
@override final  DateTime? openedAt;
@override final  DateTime? seatedAt;
 final  List<OrderItem> _items;
@override@JsonKey() List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<TimelineEvent> _timeline;
@override@JsonKey() List<TimelineEvent> get timeline {
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeline);
}

@override final  String? tableStatusDescription;
@override final  String? assignedCaptain;
@override@JsonKey() final  int capacity;
@override final  String? notes;

/// Create a copy of TableEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TableEntityCopyWith<_TableEntity> get copyWith => __$TableEntityCopyWithImpl<_TableEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TableEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TableEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.tableCode, tableCode) || other.tableCode == tableCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.location, location) || other.location == location)&&(identical(other.guestCount, guestCount) || other.guestCount == guestCount)&&(identical(other.currentTotal, currentTotal) || other.currentTotal == currentTotal)&&(identical(other.timeSeated, timeSeated) || other.timeSeated == timeSeated)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.openedAt, openedAt) || other.openedAt == openedAt)&&(identical(other.seatedAt, seatedAt) || other.seatedAt == seatedAt)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._timeline, _timeline)&&(identical(other.tableStatusDescription, tableStatusDescription) || other.tableStatusDescription == tableStatusDescription)&&(identical(other.assignedCaptain, assignedCaptain) || other.assignedCaptain == assignedCaptain)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tableNumber,tableCode,status,location,guestCount,currentTotal,timeSeated,areaName,openedAt,seatedAt,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_timeline),tableStatusDescription,assignedCaptain,capacity,notes);

@override
String toString() {
  return 'TableEntity(id: $id, tableNumber: $tableNumber, tableCode: $tableCode, status: $status, location: $location, guestCount: $guestCount, currentTotal: $currentTotal, timeSeated: $timeSeated, areaName: $areaName, openedAt: $openedAt, seatedAt: $seatedAt, items: $items, timeline: $timeline, tableStatusDescription: $tableStatusDescription, assignedCaptain: $assignedCaptain, capacity: $capacity, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$TableEntityCopyWith<$Res> implements $TableEntityCopyWith<$Res> {
  factory _$TableEntityCopyWith(_TableEntity value, $Res Function(_TableEntity) _then) = __$TableEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String tableNumber, String tableCode, TableStatus status, TableLocation location, int guestCount, double currentTotal, String timeSeated, String areaName, DateTime? openedAt, DateTime? seatedAt, List<OrderItem> items, List<TimelineEvent> timeline, String? tableStatusDescription, String? assignedCaptain, int capacity, String? notes
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tableNumber = null,Object? tableCode = null,Object? status = null,Object? location = null,Object? guestCount = null,Object? currentTotal = null,Object? timeSeated = null,Object? areaName = null,Object? openedAt = freezed,Object? seatedAt = freezed,Object? items = null,Object? timeline = null,Object? tableStatusDescription = freezed,Object? assignedCaptain = freezed,Object? capacity = null,Object? notes = freezed,}) {
  return _then(_TableEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,tableCode: null == tableCode ? _self.tableCode : tableCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TableStatus,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as TableLocation,guestCount: null == guestCount ? _self.guestCount : guestCount // ignore: cast_nullable_to_non_nullable
as int,currentTotal: null == currentTotal ? _self.currentTotal : currentTotal // ignore: cast_nullable_to_non_nullable
as double,timeSeated: null == timeSeated ? _self.timeSeated : timeSeated // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,openedAt: freezed == openedAt ? _self.openedAt : openedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,seatedAt: freezed == seatedAt ? _self.seatedAt : seatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,timeline: null == timeline ? _self._timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<TimelineEvent>,tableStatusDescription: freezed == tableStatusDescription ? _self.tableStatusDescription : tableStatusDescription // ignore: cast_nullable_to_non_nullable
as String?,assignedCaptain: freezed == assignedCaptain ? _self.assignedCaptain : assignedCaptain // ignore: cast_nullable_to_non_nullable
as String?,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
