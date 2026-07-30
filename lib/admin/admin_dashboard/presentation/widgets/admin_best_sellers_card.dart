import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../domain/entities/best_seller_entity.dart';

class AdminBestSellersCard extends StatelessWidget {
  final List<BestSellerEntity> bestSellers;

  const AdminBestSellersCard({
    super.key,
    required this.bestSellers,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.04),
            blurRadius: 10.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.bestSellers,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                AppStrings.last24h,
                style: textTheme.labelSmall?.copyWith(
                  fontFamily: 'JetBrains Mono',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                  fontSize: 10.5.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Items List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bestSellers.length,
            separatorBuilder: (_, __) => SizedBox(height: 14.h),
            itemBuilder: (context, index) {
              final item = bestSellers[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.name,
                        style: textTheme.bodyMedium?.copyWith(
                          fontFamily: 'JetBrains Mono',
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                          fontSize: 13.5.sp,
                        ),
                      ),
                      Text(
                        '${item.unitsCount} ${AppStrings.units}',
                        style: textTheme.labelSmall?.copyWith(
                          fontFamily: 'JetBrains Mono',
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 11.5.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),

                  // Horizontal Progress Bar
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: item.progressRatio.clamp(0.0, 1.0),
                        child: Container(
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
