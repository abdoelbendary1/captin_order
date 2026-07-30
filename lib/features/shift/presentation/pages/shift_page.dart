import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/services/app_notification_service.dart';
import '../bloc/shift_cubit.dart';
import '../widgets/active_shift_card.dart';
import '../widgets/shift_efficiency_card.dart';
import '../widgets/shift_recent_activity_card.dart';
import '../widgets/shift_sales_card.dart';
import '../widgets/shift_support_card.dart';
import '../widgets/shift_tasks_card.dart';
import '../widgets/shift_tip_breakdown_card.dart';

class ShiftPage extends StatelessWidget {
  const ShiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShiftCubit>(
      create: (context) => ShiftCubit(),
      child: const ShiftView(),
    );
  }
}

class ShiftView extends StatelessWidget {
  const ShiftView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: BlocBuilder<ShiftCubit, ShiftState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final shift = state.shift;
            if (shift == null) {
              return const Center(child: Text('No active shift data available.'));
            }

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 32.h),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // 1. Custom Header (Profile Avatar, Title "Shop Captain", Settings)
                  Padding(
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
                              AppStrings.shopCaptain,
                              style: textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
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
                          onPressed: () {
                            const SettingsRoute().push(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // 2. Active Shift Card
                  ActiveShiftCard(
                    startTime: shift.startTime,
                    isPaused: shift.isPaused,
                    onClockOut: () {
                      AppNotificationService.showInfo(
                        context,
                        'Shift Clocked Out successfully!',
                      );
                    },
                    onTogglePause: () {
                      context.read<ShiftCubit>().togglePauseShift();
                    },
                  ),
                  SizedBox(height: 16.h),

                  // 3. Shift Sales Card
                  ShiftSalesCard(
                    salesAmount: shift.salesAmount,
                    salesTrendPercent: shift.salesTrendPercent,
                    dailyTargetPercent: shift.dailyTargetPercent,
                  ),
                  SizedBox(height: 16.h),

                  // 4. Shift Tasks
                  ShiftTasksCard(
                    tasks: shift.tasks,
                    onToggleTask: (taskId) {
                      context.read<ShiftCubit>().toggleTask(taskId);
                    },
                  ),
                  SizedBox(height: 16.h),

                  // 5. Recent Activity
                  ShiftRecentActivityCard(
                    activities: shift.activities,
                  ),
                  SizedBox(height: 16.h),

                  // 6. Tip Breakdown
                  ShiftTipBreakdownCard(
                    digitalTips: shift.digitalTips,
                    cashTips: shift.cashTips,
                  ),
                  SizedBox(height: 16.h),

                  // 7. Efficiency
                  ShiftEfficiencyCard(
                    avgPrepTime: shift.avgPrepTime,
                    customerSatisfaction: shift.customerSatisfaction,
                  ),
                  SizedBox(height: 16.h),

                  // 8. Support Card
                  ShiftSupportCard(
                    onOpenSupport: () {
                      AppNotificationService.showInfo(
                        context,
                        'Opening support documentation...',
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
