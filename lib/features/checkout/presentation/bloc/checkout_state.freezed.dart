// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState()';
}


}

/// @nodoc
class $CheckoutStateCopyWith<$Res>  {
$CheckoutStateCopyWith(CheckoutState _, $Res Function(CheckoutState) __);
}


/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CheckoutLoadingState value)?  loading,TResult Function( CheckoutErrorState value)?  error,TResult Function( CheckoutSuccessState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CheckoutLoadingState() when loading != null:
return loading(_that);case CheckoutErrorState() when error != null:
return error(_that);case CheckoutSuccessState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CheckoutLoadingState value)  loading,required TResult Function( CheckoutErrorState value)  error,required TResult Function( CheckoutSuccessState value)  success,}){
final _that = this;
switch (_that) {
case CheckoutLoadingState():
return loading(_that);case CheckoutErrorState():
return error(_that);case CheckoutSuccessState():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CheckoutLoadingState value)?  loading,TResult? Function( CheckoutErrorState value)?  error,TResult? Function( CheckoutSuccessState value)?  success,}){
final _that = this;
switch (_that) {
case CheckoutLoadingState() when loading != null:
return loading(_that);case CheckoutErrorState() when error != null:
return error(_that);case CheckoutSuccessState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( TableEntity table,  String selectedPaymentMethod,  double selectedTipPercentage,  double customTipAmount,  bool isSettling,  bool isSettled)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CheckoutLoadingState() when loading != null:
return loading();case CheckoutErrorState() when error != null:
return error(_that.message);case CheckoutSuccessState() when success != null:
return success(_that.table,_that.selectedPaymentMethod,_that.selectedTipPercentage,_that.customTipAmount,_that.isSettling,_that.isSettled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( TableEntity table,  String selectedPaymentMethod,  double selectedTipPercentage,  double customTipAmount,  bool isSettling,  bool isSettled)  success,}) {final _that = this;
switch (_that) {
case CheckoutLoadingState():
return loading();case CheckoutErrorState():
return error(_that.message);case CheckoutSuccessState():
return success(_that.table,_that.selectedPaymentMethod,_that.selectedTipPercentage,_that.customTipAmount,_that.isSettling,_that.isSettled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( TableEntity table,  String selectedPaymentMethod,  double selectedTipPercentage,  double customTipAmount,  bool isSettling,  bool isSettled)?  success,}) {final _that = this;
switch (_that) {
case CheckoutLoadingState() when loading != null:
return loading();case CheckoutErrorState() when error != null:
return error(_that.message);case CheckoutSuccessState() when success != null:
return success(_that.table,_that.selectedPaymentMethod,_that.selectedTipPercentage,_that.customTipAmount,_that.isSettling,_that.isSettled);case _:
  return null;

}
}

}

/// @nodoc


class CheckoutLoadingState implements CheckoutState {
  const CheckoutLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.loading()';
}


}




/// @nodoc


class CheckoutErrorState implements CheckoutState {
  const CheckoutErrorState({required this.message});
  

 final  String message;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutErrorStateCopyWith<CheckoutErrorState> get copyWith => _$CheckoutErrorStateCopyWithImpl<CheckoutErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CheckoutState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CheckoutErrorStateCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory $CheckoutErrorStateCopyWith(CheckoutErrorState value, $Res Function(CheckoutErrorState) _then) = _$CheckoutErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CheckoutErrorStateCopyWithImpl<$Res>
    implements $CheckoutErrorStateCopyWith<$Res> {
  _$CheckoutErrorStateCopyWithImpl(this._self, this._then);

  final CheckoutErrorState _self;
  final $Res Function(CheckoutErrorState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CheckoutErrorState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CheckoutSuccessState implements CheckoutState {
  const CheckoutSuccessState({required this.table, this.selectedPaymentMethod = 'Card', this.selectedTipPercentage = 0.20, this.customTipAmount = 0.0, this.isSettling = false, this.isSettled = false});
  

 final  TableEntity table;
@JsonKey() final  String selectedPaymentMethod;
@JsonKey() final  double selectedTipPercentage;
@JsonKey() final  double customTipAmount;
@JsonKey() final  bool isSettling;
@JsonKey() final  bool isSettled;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutSuccessStateCopyWith<CheckoutSuccessState> get copyWith => _$CheckoutSuccessStateCopyWithImpl<CheckoutSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutSuccessState&&(identical(other.table, table) || other.table == table)&&(identical(other.selectedPaymentMethod, selectedPaymentMethod) || other.selectedPaymentMethod == selectedPaymentMethod)&&(identical(other.selectedTipPercentage, selectedTipPercentage) || other.selectedTipPercentage == selectedTipPercentage)&&(identical(other.customTipAmount, customTipAmount) || other.customTipAmount == customTipAmount)&&(identical(other.isSettling, isSettling) || other.isSettling == isSettling)&&(identical(other.isSettled, isSettled) || other.isSettled == isSettled));
}


@override
int get hashCode => Object.hash(runtimeType,table,selectedPaymentMethod,selectedTipPercentage,customTipAmount,isSettling,isSettled);

@override
String toString() {
  return 'CheckoutState.success(table: $table, selectedPaymentMethod: $selectedPaymentMethod, selectedTipPercentage: $selectedTipPercentage, customTipAmount: $customTipAmount, isSettling: $isSettling, isSettled: $isSettled)';
}


}

/// @nodoc
abstract mixin class $CheckoutSuccessStateCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory $CheckoutSuccessStateCopyWith(CheckoutSuccessState value, $Res Function(CheckoutSuccessState) _then) = _$CheckoutSuccessStateCopyWithImpl;
@useResult
$Res call({
 TableEntity table, String selectedPaymentMethod, double selectedTipPercentage, double customTipAmount, bool isSettling, bool isSettled
});


$TableEntityCopyWith<$Res> get table;

}
/// @nodoc
class _$CheckoutSuccessStateCopyWithImpl<$Res>
    implements $CheckoutSuccessStateCopyWith<$Res> {
  _$CheckoutSuccessStateCopyWithImpl(this._self, this._then);

  final CheckoutSuccessState _self;
  final $Res Function(CheckoutSuccessState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? table = null,Object? selectedPaymentMethod = null,Object? selectedTipPercentage = null,Object? customTipAmount = null,Object? isSettling = null,Object? isSettled = null,}) {
  return _then(CheckoutSuccessState(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as TableEntity,selectedPaymentMethod: null == selectedPaymentMethod ? _self.selectedPaymentMethod : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
as String,selectedTipPercentage: null == selectedTipPercentage ? _self.selectedTipPercentage : selectedTipPercentage // ignore: cast_nullable_to_non_nullable
as double,customTipAmount: null == customTipAmount ? _self.customTipAmount : customTipAmount // ignore: cast_nullable_to_non_nullable
as double,isSettling: null == isSettling ? _self.isSettling : isSettling // ignore: cast_nullable_to_non_nullable
as bool,isSettled: null == isSettled ? _self.isSettled : isSettled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CheckoutState
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
