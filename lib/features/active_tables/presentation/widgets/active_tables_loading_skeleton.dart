import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/widgets/app_shimmer.dart';

class ActiveTablesLoadingSkeleton extends StatelessWidget {
  const ActiveTablesLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: GridView.builder(
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.95,
        ),
        itemBuilder: (context, index) => const TableCardSkeleton(),
      ),
    );
  }
}

class TableCardSkeleton extends StatelessWidget {
  const TableCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: colorScheme.outline,
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Table Number & Status Chip Skeleton
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerBox(width: 65.w, height: 14.h),
                ShimmerBox(width: 58.w, height: 18.h, borderRadius: 4.r),
              ],
            ),
            const Spacer(),

            // Middle: Current Total Skeleton
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(width: 85.w, height: 10.h),
                SizedBox(height: 6.h),
                ShimmerBox(width: 95.w, height: 24.h),
              ],
            ),
            const Spacer(),

            // Footer: Guest Count Skeleton
            Row(
              children: [
                ShimmerBox(width: 16.r, height: 16.r, borderRadius: 4.r),
                SizedBox(width: 6.w),
                ShimmerBox(width: 55.w, height: 12.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
