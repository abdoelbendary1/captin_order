import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_event.freezed.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.loadDetails({required String tableId}) = LoadCheckoutDetailsEvent;
  const factory CheckoutEvent.selectPaymentMethod({required String paymentMethod}) = SelectPaymentMethodEvent;
  const factory CheckoutEvent.selectTipPercentage({required double percentage}) = SelectTipPercentageEvent;
  const factory CheckoutEvent.setCustomTipAmount({required double customAmount}) = SetCustomTipAmountEvent;
  const factory CheckoutEvent.settleAndCloseTable() = SettleAndCloseTableEvent;
}
