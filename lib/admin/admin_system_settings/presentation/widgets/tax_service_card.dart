import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../features/auth/presentation/widgets/auth_text_field.dart';

class TaxServiceCard extends StatelessWidget {
  final TextEditingController vatController;
  final TextEditingController serviceChargeController;

  const TaxServiceCard({
    super.key,
    required this.vatController,
    required this.serviceChargeController,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          children: [
            Icon(
              Icons.percent_rounded,
              size: 16.r,
              color: colorScheme.secondary,
            ),
            SizedBox(width: 6.w),
            Text(
              AppStrings.taxAndServiceUpper,
              style: textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: colorScheme.secondary,
              ),
            ),
          ],
        ),
        SizedBox(height: 14.h),

        // 2-Column Inputs Row
        Row(
          children: [
            Expanded(
              child: AuthTextField(
                label: AppStrings.vatPercent,
                hintText: '15.0',
                prefixIcon: Icons.calculate_outlined,
                controller: vatController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: AuthTextField(
                label: AppStrings.serviceChargePercent,
                hintText: '5.0',
                prefixIcon: Icons.room_service_outlined,
                controller: serviceChargeController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
