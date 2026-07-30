import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.paymentMethod,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 14.h),

          // 1. Card Option
          _buildPaymentTile(
            context: context,
            title: AppStrings.cardMethod,
            subtitle: AppStrings.cardSubtitle,
            icon: Icons.credit_card_rounded,
            value: AppStrings.cardMethod,
          ),
          SizedBox(height: 10.h),

          // 2. Cash Option
          _buildPaymentTile(
            context: context,
            title: AppStrings.cashMethod,
            subtitle: AppStrings.cashSubtitle,
            icon: Icons.payments_outlined,
            value: AppStrings.cashMethod,
          ),
          SizedBox(height: 10.h),

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
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.primaryColor
              : colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected
                ? theme.primaryColor
                : colorScheme.outlineVariant.withValues(alpha: 0.4),
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: theme.primaryColor.withValues(alpha: 0.2),
                    blurRadius: 6.r,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            // Icon Container
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: isSelected
                    ? colorScheme.onPrimary.withValues(alpha: 0.15)
                    : colorScheme.surfaceContainerHigh.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
                size: 22.r,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? colorScheme.onPrimary
                          : colorScheme.onSurface,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: textTheme.labelSmall?.copyWith(
                      fontFamily: 'JetBrains Mono',
                      color: isSelected
                          ? colorScheme.onPrimary.withValues(alpha: 0.8)
                          : colorScheme.onSurfaceVariant,
                      fontSize: 10.5.sp,
                    ),
                  ),
                ],
              ),
            ),

            // Inverted Radio Button Indicator
            Container(
              width: 20.r,
              height: 20.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? colorScheme.onPrimary : Colors.transparent,
                border: Border.all(
                  color: isSelected ? colorScheme.onPrimary : colorScheme.outlineVariant,
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
