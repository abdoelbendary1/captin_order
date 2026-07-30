import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminMenuHeader extends StatelessWidget {
  final VoidCallback? onMenuPressed;

  const AdminMenuHeader({
    super.key,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onMenuPressed ?? () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu_rounded,
                size: 26.r,
                color: colorScheme.onSurface,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            SizedBox(width: 14.w),
            Text(
              'Cafe Admin',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
        Container(
          width: 40.r,
          height: 40.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.primaryContainer,
          ),
          clipBehavior: Clip.antiAlias,
          child: Icon(
            Icons.person_rounded,
            color: colorScheme.onPrimaryContainer,
            size: 24.r,
          ),
        ),
      ],
    );
  }
}
