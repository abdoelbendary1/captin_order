import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/shift_task_entity.dart';

class ShiftTasksCard extends StatelessWidget {
  final List<ShiftTaskEntity> tasks;
  final ValueChanged<String> onToggleTask;

  const ShiftTasksCard({
    super.key,
    required this.tasks,
    required this.onToggleTask,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final remainingCount = tasks.where((t) => !t.isCompleted).length;

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
              Row(
                children: [
                  Icon(
                    Icons.checklist_rounded,
                    color: colorScheme.onSurface,
                    size: 22.r,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Shift Tasks',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  '$remainingCount Remaining',
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSecondaryContainer,
                    fontSize: 10.5.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // List Items
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tasks.length,
            separatorBuilder: (_, __) => SizedBox(height: 10.h),
            itemBuilder: (context, index) {
              final task = tasks[index];
              return _TaskTile(
                task: task,
                onTap: () => onToggleTask(task.id),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TaskTile extends StatelessWidget {
  final ShiftTaskEntity task;
  final VoidCallback onTap;

  const _TaskTile({
    required this.task,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isHighPriority = task.priority == ShiftTaskPriority.high;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: task.isCompleted
              ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.25)
              : colorScheme.surface,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: colorScheme.outlineVariant.withValues(alpha: 0.4),
          ),
        ),
        child: Row(
          children: [
            // Custom Square Checkbox
            Container(
              width: 20.r,
              height: 20.r,
              decoration: BoxDecoration(
                color: task.isCompleted
                    ? colorScheme.outlineVariant
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: task.isCompleted
                      ? colorScheme.outlineVariant
                      : colorScheme.outline,
                  width: 1.5,
                ),
              ),
              child: task.isCompleted
                  ? Icon(
                      Icons.check_rounded,
                      size: 14.r,
                      color: colorScheme.surface,
                    )
                  : null,
            ),
            SizedBox(width: 12.w),

            // Task Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: task.isCompleted
                          ? colorScheme.onSurfaceVariant.withValues(alpha: 0.6)
                          : colorScheme.onSurface,
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 13.5.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    task.subtitle,
                    style: textTheme.labelSmall?.copyWith(
                      color: task.isCompleted
                          ? colorScheme.onSurfaceVariant.withValues(alpha: 0.5)
                          : colorScheme.onSurfaceVariant,
                      fontSize: 10.5.sp,
                    ),
                  ),
                ],
              ),
            ),

            // Trailing Vertical Accent Line Indicator
            if (!task.isCompleted)
              Container(
                width: 3.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: isHighPriority
                      ? colorScheme.error
                      : theme.primaryColor,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
