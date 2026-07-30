import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShiftSupportCard extends StatelessWidget {
  final VoidCallback onOpenSupport;

  const ShiftSupportCard({
    super.key,
    required this.onOpenSupport,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF6F4622),
                  const Color(0xFF4A2E16),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Need help with the shift?',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 6.h),
                SizedBox(
                  width: 220.w,
                  child: Text(
                    'Contact the store manager or view the help documentation.',
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 12.sp,
                      height: 1.3,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: onOpenSupport,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF4A2E16),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'Open Support',
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4A2E16),
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Watermark Question Mark Icon in bottom right
          Positioned(
            right: -10.w,
            bottom: -15.h,
            child: Text(
              '?',
              style: textTheme.displayLarge?.copyWith(
                fontSize: 100.sp,
                color: colorScheme.onPrimary.withValues(alpha: 0.1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
