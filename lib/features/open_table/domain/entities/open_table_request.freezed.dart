// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_table_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OpenTableRequest {

 String get tableNumber; int get guestCount; String get areaName; String? get assignedCaptain;
/// Create a copy of OpenTableRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenTableRequestCopyWith<OpenTableRequest> get copyWith => _$OpenTableRequestCopyWithImpl<OpenTableRequest>(this as OpenTableRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenTableRequest&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.guestCount, guestCount) || other.guestCount == guestCount)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.assignedCaptain, assignedCaptain) || other.assignedCaptain == assignedCaptain));
}


@override
int get hashCode => Object.hash(runtimeType,tableNumber,guestCount,areaName,assignedCaptain);

@override
String toString() {
  return 'OpenTableRequest(tableNumber: $tableNumber, guestCount: $guestCount, areaName: $areaName, assignedCaptain: $assignedCaptain)';
}


}

/// @nodoc
abstract mixin class $OpenTableRequestCopyWith<$Res>  {
  factory $OpenTableRequestCopyWith(OpenTableRequest value, $Res Function(OpenTableRequest) _then) = _$OpenTableRequestCopyWithImpl;
@useResult
$Res call({
 String tableNumber, int guestCount, String areaName, String? assignedCaptain
});




}
/// @nodoc
class _$OpenTableRequestCopyWithImpl<$Res>
    implements $OpenTableRequestCopyWith<$Res> {
  _$OpenTableRequestCopyWithImpl(this._self, this._then);

  final OpenTableRequest _self;
  final $Res Function(OpenTableRequest) _then;

/// Create a copy of OpenTableRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tableNumber = null,Object? guestCount = null,Object? areaName = null,Object? assignedCaptain = freezed,}) {
  return _then(_self.copyWith(
tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,guestCount: null == guestCount ? _self.guestCount : guestCount // ignore: cast_nullable_to_non_nullable
as int,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,assignedCaptain: freezed == assignedCaptain ? _self.assignedCaptain : assignedCaptain // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenTableRequest].
extension OpenTableRequestPatterns on OpenTableRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenTableRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenTableRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenTableRequest value)  $default,){
final _that = this;
switch (_that) {
case _OpenTableRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenTableRequest value)?  $default,){
final _that = this;
switch (_that) {
case _OpenTableRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tableNumber,  int guestCount,  String areaName,  String? assignedCaptain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenTableRequest() when $default != null:
return $default(_that.tableNumber,_that.guestCount,_that.areaName,_that.assignedCaptain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tableNumber,  int guestCount,  String areaName,  String? assignedCaptain)  $default,) {final _that = this;
switch (_that) {
case _OpenTableRequest():
return $default(_that.tableNumber,_that.guestCount,_that.areaName,_that.assignedCaptain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tableNumber,  int guestCount,  String areaName,  String? assignedCaptain)?  $default,) {final _that = this;
switch (_that) {
case _OpenTableRequest() when $default != null:
return $default(_that.tableNumber,_that.guestCount,_that.areaName,_that.assignedCaptain);case _:
  return null;

}
}

}

/// @nodoc


class _OpenTableRequest implements OpenTableRequest {
  const _OpenTableRequest({required this.tableNumber, required this.guestCount, required this.areaName, this.assignedCaptain});
  

@override final  String tableNumber;
@override final  int guestCount;
@override final  String areaName;
@override final  String? assignedCaptain;

/// Create a copy of OpenTableRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenTableRequestCopyWith<_OpenTableRequest> get copyWith => __$OpenTableRequestCopyWithImpl<_OpenTableRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenTableRequest&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.guestCount, guestCount) || other.guestCount == guestCount)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.assignedCaptain, assignedCaptain) || other.assignedCaptain == assignedCaptain));
}


@override
int get hashCode => Object.hash(runtimeType,tableNumber,guestCount,areaName,assignedCaptain);

@override
String toString() {
  return 'OpenTableRequest(tableNumber: $tableNumber, guestCount: $guestCount, areaName: $areaName, assignedCaptain: $assignedCaptain)';
}


}

/// @nodoc
abstract mixin class _$OpenTableRequestCopyWith<$Res> implements $OpenTableRequestCopyWith<$Res> {
  factory _$OpenTableRequestCopyWith(_OpenTableRequest value, $Res Function(_OpenTableRequest) _then) = __$OpenTableRequestCopyWithImpl;
@override @useResult
$Res call({
 String tableNumber, int guestCount, String areaName, String? assignedCaptain
});




}
/// @nodoc
class __$OpenTableRequestCopyWithImpl<$Res>
    implements _$OpenTableRequestCopyWith<$Res> {
  __$OpenTableRequestCopyWithImpl(this._self, this._then);

  final _OpenTableRequest _self;
  final $Res Function(_OpenTableRequest) _then;

/// Create a copy of OpenTableRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tableNumber = null,Object? guestCount = null,Object? areaName = null,Object? assignedCaptain = freezed,}) {
  return _then(_OpenTableRequest(
tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,guestCount: null == guestCount ? _self.guestCount : guestCount // ignore: cast_nullable_to_non_nullable
as int,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,assignedCaptain: freezed == assignedCaptain ? _self.assignedCaptain : assignedCaptain // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
