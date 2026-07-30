import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class PlaceHeader extends StatelessWidget {
  const PlaceHeader({super.key});

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
              if (Navigator.canPop(context)) ...[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: colorScheme.onSurface,
                    size: 22.r,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(width: 4.w),
              ] else ...[
                Icon(
                  Icons.coffee_rounded,
                  color: colorScheme.onSurface,
                  size: 24.r,
                ),
                SizedBox(width: 8.w),
              ],
              Text(
                AppStrings.shopCaptain,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: colorScheme.onSurface,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
              color: colorScheme.onSurface,
              size: 22.r,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
