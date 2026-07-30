import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/router/app_router.dart';

class ActiveTablesFab extends StatelessWidget {
  const ActiveTablesFab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: 56.r,
      height: 56.r,
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: () async {
            await OrderItemsRoute(
              tableNumber: 'TakeAway_${DateTime.now().millisecondsSinceEpoch}',
              areaName: AppStrings.takeAway,
            ).push(context);
          },
          child: Center(
            child: Icon(
              Icons.shopping_bag_outlined,
              color: colorScheme.onPrimary,
              size: 26.r,
            ),
          ),
        ),
      ),
    );
  }
}
