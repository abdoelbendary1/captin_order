// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutEvent()';
}


}

/// @nodoc
class $CheckoutEventCopyWith<$Res>  {
$CheckoutEventCopyWith(CheckoutEvent _, $Res Function(CheckoutEvent) __);
}


/// Adds pattern-matching-related methods to [CheckoutEvent].
extension CheckoutEventPatterns on CheckoutEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadCheckoutDetailsEvent value)?  loadDetails,TResult Function( SelectPaymentMethodEvent value)?  selectPaymentMethod,TResult Function( SelectTipPercentageEvent value)?  selectTipPercentage,TResult Function( SetCustomTipAmountEvent value)?  setCustomTipAmount,TResult Function( SettleAndCloseTableEvent value)?  settleAndCloseTable,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadCheckoutDetailsEvent() when loadDetails != null:
return loadDetails(_that);case SelectPaymentMethodEvent() when selectPaymentMethod != null:
return selectPaymentMethod(_that);case SelectTipPercentageEvent() when selectTipPercentage != null:
return selectTipPercentage(_that);case SetCustomTipAmountEvent() when setCustomTipAmount != null:
return setCustomTipAmount(_that);case SettleAndCloseTableEvent() when settleAndCloseTable != null:
return settleAndCloseTable(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadCheckoutDetailsEvent value)  loadDetails,required TResult Function( SelectPaymentMethodEvent value)  selectPaymentMethod,required TResult Function( SelectTipPercentageEvent value)  selectTipPercentage,required TResult Function( SetCustomTipAmountEvent value)  setCustomTipAmount,required TResult Function( SettleAndCloseTableEvent value)  settleAndCloseTable,}){
final _that = this;
switch (_that) {
case LoadCheckoutDetailsEvent():
return loadDetails(_that);case SelectPaymentMethodEvent():
return selectPaymentMethod(_that);case SelectTipPercentageEvent():
return selectTipPercentage(_that);case SetCustomTipAmountEvent():
return setCustomTipAmount(_that);case SettleAndCloseTableEvent():
return settleAndCloseTable(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadCheckoutDetailsEvent value)?  loadDetails,TResult? Function( SelectPaymentMethodEvent value)?  selectPaymentMethod,TResult? Function( SelectTipPercentageEvent value)?  selectTipPercentage,TResult? Function( SetCustomTipAmountEvent value)?  setCustomTipAmount,TResult? Function( SettleAndCloseTableEvent value)?  settleAndCloseTable,}){
final _that = this;
switch (_that) {
case LoadCheckoutDetailsEvent() when loadDetails != null:
return loadDetails(_that);case SelectPaymentMethodEvent() when selectPaymentMethod != null:
return selectPaymentMethod(_that);case SelectTipPercentageEvent() when selectTipPercentage != null:
return selectTipPercentage(_that);case SetCustomTipAmountEvent() when setCustomTipAmount != null:
return setCustomTipAmount(_that);case SettleAndCloseTableEvent() when settleAndCloseTable != null:
return settleAndCloseTable(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String tableId)?  loadDetails,TResult Function( String paymentMethod)?  selectPaymentMethod,TResult Function( double percentage)?  selectTipPercentage,TResult Function( double customAmount)?  setCustomTipAmount,TResult Function()?  settleAndCloseTable,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadCheckoutDetailsEvent() when loadDetails != null:
return loadDetails(_that.tableId);case SelectPaymentMethodEvent() when selectPaymentMethod != null:
return selectPaymentMethod(_that.paymentMethod);case SelectTipPercentageEvent() when selectTipPercentage != null:
return selectTipPercentage(_that.percentage);case SetCustomTipAmountEvent() when setCustomTipAmount != null:
return setCustomTipAmount(_that.customAmount);case SettleAndCloseTableEvent() when settleAndCloseTable != null:
return settleAndCloseTable();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String tableId)  loadDetails,required TResult Function( String paymentMethod)  selectPaymentMethod,required TResult Function( double percentage)  selectTipPercentage,required TResult Function( double customAmount)  setCustomTipAmount,required TResult Function()  settleAndCloseTable,}) {final _that = this;
switch (_that) {
case LoadCheckoutDetailsEvent():
return loadDetails(_that.tableId);case SelectPaymentMethodEvent():
return selectPaymentMethod(_that.paymentMethod);case SelectTipPercentageEvent():
return selectTipPercentage(_that.percentage);case SetCustomTipAmountEvent():
return setCustomTipAmount(_that.customAmount);case SettleAndCloseTableEvent():
return settleAndCloseTable();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String tableId)?  loadDetails,TResult? Function( String paymentMethod)?  selectPaymentMethod,TResult? Function( double percentage)?  selectTipPercentage,TResult? Function( double customAmount)?  setCustomTipAmount,TResult? Function()?  settleAndCloseTable,}) {final _that = this;
switch (_that) {
case LoadCheckoutDetailsEvent() when loadDetails != null:
return loadDetails(_that.tableId);case SelectPaymentMethodEvent() when selectPaymentMethod != null:
return selectPaymentMethod(_that.paymentMethod);case SelectTipPercentageEvent() when selectTipPercentage != null:
return selectTipPercentage(_that.percentage);case SetCustomTipAmountEvent() when setCustomTipAmount != null:
return setCustomTipAmount(_that.customAmount);case SettleAndCloseTableEvent() when settleAndCloseTable != null:
return settleAndCloseTable();case _:
  return null;

}
}

}

/// @nodoc


class LoadCheckoutDetailsEvent implements CheckoutEvent {
  const LoadCheckoutDetailsEvent({required this.tableId});
  

 final  String tableId;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadCheckoutDetailsEventCopyWith<LoadCheckoutDetailsEvent> get copyWith => _$LoadCheckoutDetailsEventCopyWithImpl<LoadCheckoutDetailsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadCheckoutDetailsEvent&&(identical(other.tableId, tableId) || other.tableId == tableId));
}


@override
int get hashCode => Object.hash(runtimeType,tableId);

@override
String toString() {
  return 'CheckoutEvent.loadDetails(tableId: $tableId)';
}


}

/// @nodoc
abstract mixin class $LoadCheckoutDetailsEventCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory $LoadCheckoutDetailsEventCopyWith(LoadCheckoutDetailsEvent value, $Res Function(LoadCheckoutDetailsEvent) _then) = _$LoadCheckoutDetailsEventCopyWithImpl;
@useResult
$Res call({
 String tableId
});




}
/// @nodoc
class _$LoadCheckoutDetailsEventCopyWithImpl<$Res>
    implements $LoadCheckoutDetailsEventCopyWith<$Res> {
  _$LoadCheckoutDetailsEventCopyWithImpl(this._self, this._then);

  final LoadCheckoutDetailsEvent _self;
  final $Res Function(LoadCheckoutDetailsEvent) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tableId = null,}) {
  return _then(LoadCheckoutDetailsEvent(
tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SelectPaymentMethodEvent implements CheckoutEvent {
  const SelectPaymentMethodEvent({required this.paymentMethod});
  

 final  String paymentMethod;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectPaymentMethodEventCopyWith<SelectPaymentMethodEvent> get copyWith => _$SelectPaymentMethodEventCopyWithImpl<SelectPaymentMethodEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectPaymentMethodEvent&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}


@override
int get hashCode => Object.hash(runtimeType,paymentMethod);

@override
String toString() {
  return 'CheckoutEvent.selectPaymentMethod(paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class $SelectPaymentMethodEventCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory $SelectPaymentMethodEventCopyWith(SelectPaymentMethodEvent value, $Res Function(SelectPaymentMethodEvent) _then) = _$SelectPaymentMethodEventCopyWithImpl;
@useResult
$Res call({
 String paymentMethod
});




}
/// @nodoc
class _$SelectPaymentMethodEventCopyWithImpl<$Res>
    implements $SelectPaymentMethodEventCopyWith<$Res> {
  _$SelectPaymentMethodEventCopyWithImpl(this._self, this._then);

  final SelectPaymentMethodEvent _self;
  final $Res Function(SelectPaymentMethodEvent) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paymentMethod = null,}) {
  return _then(SelectPaymentMethodEvent(
paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SelectTipPercentageEvent implements CheckoutEvent {
  const SelectTipPercentageEvent({required this.percentage});
  

 final  double percentage;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectTipPercentageEventCopyWith<SelectTipPercentageEvent> get copyWith => _$SelectTipPercentageEventCopyWithImpl<SelectTipPercentageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectTipPercentageEvent&&(identical(other.percentage, percentage) || other.percentage == percentage));
}


@override
int get hashCode => Object.hash(runtimeType,percentage);

@override
String toString() {
  return 'CheckoutEvent.selectTipPercentage(percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class $SelectTipPercentageEventCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory $SelectTipPercentageEventCopyWith(SelectTipPercentageEvent value, $Res Function(SelectTipPercentageEvent) _then) = _$SelectTipPercentageEventCopyWithImpl;
@useResult
$Res call({
 double percentage
});




}
/// @nodoc
class _$SelectTipPercentageEventCopyWithImpl<$Res>
    implements $SelectTipPercentageEventCopyWith<$Res> {
  _$SelectTipPercentageEventCopyWithImpl(this._self, this._then);

  final SelectTipPercentageEvent _self;
  final $Res Function(SelectTipPercentageEvent) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? percentage = null,}) {
  return _then(SelectTipPercentageEvent(
percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class SetCustomTipAmountEvent implements CheckoutEvent {
  const SetCustomTipAmountEvent({required this.customAmount});
  

 final  double customAmount;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetCustomTipAmountEventCopyWith<SetCustomTipAmountEvent> get copyWith => _$SetCustomTipAmountEventCopyWithImpl<SetCustomTipAmountEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetCustomTipAmountEvent&&(identical(other.customAmount, customAmount) || other.customAmount == customAmount));
}


@override
int get hashCode => Object.hash(runtimeType,customAmount);

@override
String toString() {
  return 'CheckoutEvent.setCustomTipAmount(customAmount: $customAmount)';
}


}

/// @nodoc
abstract mixin class $SetCustomTipAmountEventCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory $SetCustomTipAmountEventCopyWith(SetCustomTipAmountEvent value, $Res Function(SetCustomTipAmountEvent) _then) = _$SetCustomTipAmountEventCopyWithImpl;
@useResult
$Res call({
 double customAmount
});




}
/// @nodoc
class _$SetCustomTipAmountEventCopyWithImpl<$Res>
    implements $SetCustomTipAmountEventCopyWith<$Res> {
  _$SetCustomTipAmountEventCopyWithImpl(this._self, this._then);

  final SetCustomTipAmountEvent _self;
  final $Res Function(SetCustomTipAmountEvent) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? customAmount = null,}) {
  return _then(SetCustomTipAmountEvent(
customAmount: null == customAmount ? _self.customAmount : customAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class SettleAndCloseTableEvent implements CheckoutEvent {
  const SettleAndCloseTableEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettleAndCloseTableEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutEvent.settleAndCloseTable()';
}


}




// dart format on
