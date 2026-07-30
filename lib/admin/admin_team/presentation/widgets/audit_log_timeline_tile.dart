import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../domain/entities/admin_audit_log_entity.dart';

class AuditLogTimelineTile extends StatelessWidget {
  final AdminAuditLogEntity log;

  const AuditLogTimelineTile({
    super.key,
    required this.log,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isRefund = log.badgeType == AuditLogBadgeType.refund;

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time Label
          SizedBox(
            width: 48.w,
            child: Text(
              log.time,
              style: textTheme.labelSmall?.copyWith(
                fontFamily: 'JetBrains Mono',
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                fontSize: 11.sp,
              ),
            ),
          ),

          // Avatar Node
          CircleAvatar(
            radius: 14.r,
            backgroundColor: colorScheme.secondaryContainer,
            child: Icon(
              Icons.person_rounded,
              color: colorScheme.onSecondaryContainer,
              size: 16.r,
            ),
          ),
          SizedBox(width: 12.w),

          // Log Card
          Expanded(
            child: Container(
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(14.r),
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
                  // Staff Name + Badge Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        log.staffName,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                          fontSize: 14.sp,
                        ),
                      ),

                      // Badge
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: isRefund
                              ? colorScheme.secondaryContainer
                              : colorScheme.errorContainer,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          isRefund
                              ? AppStrings.refundBadge
                              : AppStrings.orderEditBadge,
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isRefund
                                ? colorScheme.onSecondaryContainer
                                : colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),

                  // Description Body
                  Text(
                    log.description,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 12.5.sp,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
