import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../features/auth/presentation/widgets/auth_text_field.dart';

class InvoiceDetailsCard extends StatelessWidget {
  final TextEditingController cafeNameController;
  final TextEditingController welcomeMsgController;

  const InvoiceDetailsCard({
    super.key,
    required this.cafeNameController,
    required this.welcomeMsgController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 16.r,
              color: colorScheme.secondary,
            ),
            SizedBox(width: 6.w),
            Text(
              AppStrings.invoiceDetailsUpper,
              style: textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: colorScheme.secondary,
              ),
            ),
          ],
        ),
        SizedBox(height: 14.h),

        // Store Logo Upload Box
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(14.r),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48.r,
                height: 48.r,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.image_outlined,
                  color: colorScheme.onSurfaceVariant,
                  size: 24.r,
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.storeLogo,
                      style: textTheme.titleMedium?.copyWith(
                        fontFamily: 'JetBrains Mono',
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                        fontSize: 13.5.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      AppStrings.uploadPngHint,
                      style: textTheme.bodySmall?.copyWith(
                        fontFamily: 'JetBrains Mono',
                        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                        fontSize: 10.5.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        // Field 1: Cafe Name
        AuthTextField(
          label: AppStrings.cafeName,
          hintText: 'Artisanal Brew Co.',
          prefixIcon: Icons.storefront_outlined,
          controller: cafeNameController,
        ),
        SizedBox(height: 14.h),

        // Field 2: Welcome Message (Footer)
        AuthTextField(
          label: AppStrings.welcomeMessageFooter,
          hintText: 'Thank you for supporting artisanal craftsmanship.',
          prefixIcon: Icons.chat_bubble_outline_rounded,
          controller: welcomeMsgController,
        ),
      ],
    );
  }
}
