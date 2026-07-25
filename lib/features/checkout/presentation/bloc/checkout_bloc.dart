import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/checkout_repository.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

@injectable
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutRepository _repository;
  String? _currentTableId;

  CheckoutBloc(this._repository) : super(const CheckoutState.loading()) {
    on<LoadCheckoutDetailsEvent>(_onLoadDetails);
    on<SelectPaymentMethodEvent>(_onSelectPaymentMethod);
    on<SelectTipPercentageEvent>(_onSelectTipPercentage);
    on<SetCustomTipAmountEvent>(_onSetCustomTipAmount);
    on<SettleAndCloseTableEvent>(_onSettleAndCloseTable);
  }

  Future<void> _onLoadDetails(
    LoadCheckoutDetailsEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    _currentTableId = event.tableId;
    emit(const CheckoutState.loading());
    final result = await _repository.getTableCheckoutDetails(event.tableId);
    result.fold(
      (failure) => emit(CheckoutState.error(message: failure.displayMessage)),
      (table) => emit(CheckoutState.success(table: table)),
    );
  }

  void _onSelectPaymentMethod(
    SelectPaymentMethodEvent event,
    Emitter<CheckoutState> emit,
  ) {
    if (state is CheckoutSuccessState) {
      final currentState = state as CheckoutSuccessState;
      emit(currentState.copyWith(selectedPaymentMethod: event.paymentMethod));
    }
  }

  void _onSelectTipPercentage(
    SelectTipPercentageEvent event,
    Emitter<CheckoutState> emit,
  ) {
    if (state is CheckoutSuccessState) {
      final currentState = state as CheckoutSuccessState;
      emit(currentState.copyWith(
        selectedTipPercentage: event.percentage,
        customTipAmount: 0.0,
      ));
    }
  }

  void _onSetCustomTipAmount(
    SetCustomTipAmountEvent event,
    Emitter<CheckoutState> emit,
  ) {
    if (state is CheckoutSuccessState) {
      final currentState = state as CheckoutSuccessState;
      emit(currentState.copyWith(
        selectedTipPercentage: -1.0,
        customTipAmount: event.customAmount,
      ));
    }
  }

  Future<void> _onSettleAndCloseTable(
    SettleAndCloseTableEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    if (_currentTableId == null) return;
    if (state is CheckoutSuccessState) {
      final currentState = state as CheckoutSuccessState;
      emit(currentState.copyWith(isSettling: true));

      final itemsTotal = currentState.table.items.fold<double>(
        0.0,
        (sum, item) => sum + (item.price * item.quantity),
      );
      final tax = itemsTotal * 0.08;
      final baseTotal = itemsTotal + tax;

      double tipAmount = 0.0;
      if (currentState.selectedTipPercentage > 0) {
        tipAmount = itemsTotal * currentState.selectedTipPercentage;
      } else if (currentState.selectedTipPercentage == -1.0) {
        tipAmount = currentState.customTipAmount;
      }

      final grandTotal = baseTotal + tipAmount;

      final result = await _repository.settleAndCloseTable(
        tableId: _currentTableId!,
        paymentMethod: currentState.selectedPaymentMethod,
        tipAmount: tipAmount,
        totalPaid: grandTotal,
      );

      result.fold(
        (failure) => emit(currentState.copyWith(
          isSettling: false,
        )),
        (table) => emit(currentState.copyWith(
          table: table,
          isSettling: false,
          isSettled: true,
        )),
      );
    }
  }
}
