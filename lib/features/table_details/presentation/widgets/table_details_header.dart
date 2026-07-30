import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/router/app_router.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

class TableDetailsHeader extends StatelessWidget {
  final TableEntity table;

  const TableDetailsHeader({
    super.key,
    required this.table,
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
              CircleAvatar(
                radius: 20.r,
                backgroundColor: colorScheme.secondaryContainer,
                child: Icon(
                  Icons.person_rounded,
                  color: colorScheme.onSecondaryContainer,
                  size: 22.r,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                '${AppStrings.tablePrefix}${table.tableNumber} - ${AppStrings.occupiedStatus}',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                  fontSize: 18.sp,
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
            onPressed: () {
              const SettingsRoute().push(context);
            },
          ),
        ],
      ),
    );
  }
}
