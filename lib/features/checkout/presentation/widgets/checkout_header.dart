import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class CheckoutHeader extends StatelessWidget {
  final String tableNumber;
  final VoidCallback onBack;

  const CheckoutHeader({
    super.key,
    required this.tableNumber,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_rounded, color: colorScheme.onSurface, size: 22.r),
                onPressed: onBack,
              ),
              SizedBox(width: 4.w),
              Text(
                AppStrings.checkout,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'Table $tableNumber',
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSecondaryContainer,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              IconButton(
                icon: Icon(Icons.info_outline_rounded, color: colorScheme.onSurfaceVariant, size: 20.r),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
