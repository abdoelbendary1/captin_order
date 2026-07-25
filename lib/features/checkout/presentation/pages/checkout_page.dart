import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/services/app_notification_service.dart';
import '../bloc/checkout_bloc.dart';
import '../bloc/checkout_event.dart';
import '../bloc/checkout_state.dart';
import '../widgets/artisanal_receipt_card.dart';
import '../widgets/checkout_header.dart';
import '../widgets/payment_method_selector.dart';
import '../widgets/tip_selector_widget.dart';

class CheckoutPage extends StatelessWidget {
  final String tableId;

  const CheckoutPage({
    super.key,
    required this.tableId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckoutBloc>(
      create: (context) =>
          getIt<CheckoutBloc>()..add(CheckoutEvent.loadDetails(tableId: tableId)),
      child: CheckoutView(tableId: tableId),
    );
  }
}

class CheckoutView extends StatelessWidget {
  final String tableId;

  const CheckoutView({
    super.key,
    required this.tableId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            AppNotificationService.showError(context, message);
          },
          success: (table, _, __, ___, ____, isSettled) {
            if (isSettled) {
              AppNotificationService.showSuccess(
                context,
                'Table ${table.tableNumber} closed & receipt printed!',
              );
              const ActiveTablesRoute().go(context);
            }
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorScheme.surfaceContainerLow,
          body: SafeArea(
            child: state.map(
              loading: (_) => const Center(child: CircularProgressIndicator()),
              error: (err) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(err.message),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Back'),
                    ),
                  ],
                ),
              ),
              success: (successState) {
                final table = successState.table;
                final itemsTotal = table.items.fold<double>(
                  0.0,
                  (sum, item) => sum + (item.price * item.quantity),
                );

                double tipAmount = 0.0;
                if (successState.selectedTipPercentage > 0) {
                  tipAmount = itemsTotal * successState.selectedTipPercentage;
                } else if (successState.selectedTipPercentage == -1.0) {
                  tipAmount = successState.customTipAmount;
                }

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 32.0),
                  child: Column(
                    children: [
                      // 1. Header (Back arrow + Title + Table badge)
                      CheckoutHeader(
                        tableNumber: table.tableNumber,
                        onBack: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(height: 8.0),

                      // 2. Artisanal Receipt Card (Serrated zigzag edge)
                      ArtisanalReceiptCard(
                        table: table,
                        tipAmount: tipAmount,
                      ),
                      const SizedBox(height: 16.0),

                      // 3. Payment Method Selector (Card, Cash, Digital Wallet)
                      PaymentMethodSelector(
                        selectedMethod: successState.selectedPaymentMethod,
                        onMethodSelected: (method) {
                          context.read<CheckoutBloc>().add(
                                CheckoutEvent.selectPaymentMethod(paymentMethod: method),
                              );
                        },
                      ),
                      const SizedBox(height: 16.0),

                      // 4. Add Tip Selector (15%, 20%, 25%, Custom)
                      TipSelectorWidget(
                        selectedTipPercentage: successState.selectedTipPercentage,
                        customTipAmount: successState.customTipAmount,
                        onTipPercentageSelected: (percentage) {
                          context.read<CheckoutBloc>().add(
                                CheckoutEvent.selectTipPercentage(percentage: percentage),
                              );
                        },
                        onCustomTipAmountChanged: (customAmount) {
                          context.read<CheckoutBloc>().add(
                                CheckoutEvent.setCustomTipAmount(customAmount: customAmount),
                              );
                        },
                      ),
                      const SizedBox(height: 24.0),

                      // 5. Action Buttons (Close Table & Print Receipt + Split Bill)
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: successState.isSettling
                                  ? null
                                  : () {
                                      context.read<CheckoutBloc>().add(
                                            const CheckoutEvent.settleAndCloseTable(),
                                          );
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.primaryColor,
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 0,
                              ),
                              child: successState.isSettling
                                  ? SizedBox(
                                      width: 22.0,
                                      height: 22.0,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                        color: colorScheme.onPrimary,
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.print_outlined,
                                          color: colorScheme.onPrimary,
                                          size: 20.0,
                                        ),
                                        const SizedBox(width: 8.0),
                                        Text(
                                          AppStrings.closeTableAndPrintReceipt,
                                          style: textTheme.titleSmall?.copyWith(
                                            color: colorScheme.onPrimary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                AppNotificationService.showInfo(
                                  context,
                                  AppStrings.splitBillTriggered,
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                side: BorderSide(
                                  color: colorScheme.outlineVariant,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: Text(
                                AppStrings.splitBill,
                                style: textTheme.titleSmall?.copyWith(
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
