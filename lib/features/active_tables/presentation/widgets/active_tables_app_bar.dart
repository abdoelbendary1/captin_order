import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class ActiveTablesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ActiveTablesAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(72.h);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      color: colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              // Avatar Thumbnail
              Container(
                width: 44.r,
                height: 44.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: colorScheme.outline,
                    width: 1.w,
                  ),
                  color: colorScheme.surfaceContainerHigh,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9.r),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=150',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: colorScheme.secondaryContainer,
                        child: Icon(
                          Icons.storefront_rounded,
                          color: colorScheme.primary,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 12.w),

              // Title & Subtitle Column
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.shopCaptain,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Icon(
                          Icons.wb_sunny_outlined,
                          size: 13.r,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          AppStrings.morningShift,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 12.sp,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Settings Icon Button
              IconButton(
                icon: Icon(
                  Icons.settings_outlined,
                  color: colorScheme.onSurface,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
