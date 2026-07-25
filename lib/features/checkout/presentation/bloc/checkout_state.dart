import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

part 'checkout_state.freezed.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.loading() = CheckoutLoadingState;
  const factory CheckoutState.error({required String message}) = CheckoutErrorState;
  const factory CheckoutState.success({
    required TableEntity table,
    @Default('Card') String selectedPaymentMethod,
    @Default(0.20) double selectedTipPercentage,
    @Default(0.0) double customTipAmount,
    @Default(false) bool isSettling,
    @Default(false) bool isSettled,
  }) = CheckoutSuccessState;
}
