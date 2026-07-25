import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class OpenTableProceedButton extends StatelessWidget {
  final bool isSubmitting;
  final VoidCallback onPressed;

  const OpenTableProceedButton({
    super.key,
    required this.isSubmitting,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: SizedBox(
        width: double.infinity,
        height: 52.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.primaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          onPressed: isSubmitting ? null : onPressed,
          child: isSubmitting
              ? SizedBox(
                  width: 24.r,
                  height: 24.r,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: colorScheme.onPrimary,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.proceedToOrder,
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: colorScheme.onPrimary,
                      size: 20.r,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
