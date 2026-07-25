import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';

class PaymentMethodSelector extends StatelessWidget {
  final String selectedMethod;
  final ValueChanged<String> onMethodSelected;

  const PaymentMethodSelector({
    super.key,
    required this.selectedMethod,
    required this.onMethodSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.paymentMethod,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 14.0),

          // 1. Card Option
          _buildPaymentTile(
            context: context,
            title: AppStrings.cardMethod,
            subtitle: AppStrings.cardSubtitle,
            icon: Icons.credit_card_rounded,
            value: AppStrings.cardMethod,
          ),
          const SizedBox(height: 10.0),

          // 2. Cash Option
          _buildPaymentTile(
            context: context,
            title: AppStrings.cashMethod,
            subtitle: AppStrings.cashSubtitle,
            icon: Icons.payments_outlined,
            value: AppStrings.cashMethod,
          ),
          const SizedBox(height: 10.0),

          // 3. Digital Wallet Option
          _buildPaymentTile(
            context: context,
            title: AppStrings.digitalWalletMethod,
            subtitle: AppStrings.digitalWalletSubtitle,
            icon: Icons.contactless_rounded,
            value: AppStrings.digitalWalletMethod,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required String value,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isSelected = selectedMethod == value;

    return GestureDetector(
      onTap: () => onMethodSelected(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.surfaceContainerLow
              : colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected
                ? colorScheme.onSurface
                : colorScheme.outlineVariant.withValues(alpha: 0.5),
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isSelected
                    ? colorScheme.primaryContainer
                    : colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.onSurfaceVariant,
                size: 22.0,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    subtitle,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 10.5,
                    ),
                  ),
                ],
              ),
            ),

            // Radio Button Indicator
            Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? colorScheme.onSurface : colorScheme.outlineVariant,
                  width: isSelected ? 6.0 : 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
