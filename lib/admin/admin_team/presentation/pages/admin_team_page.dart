import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/services/app_notification_service.dart';
import '../bloc/admin_team_bloc.dart';
import '../bloc/admin_team_event.dart';
import '../bloc/admin_team_state.dart';
import '../widgets/add_staff_dialog.dart';
import '../widgets/audit_log_timeline_tile.dart';
import '../widgets/staff_card.dart';
import '../widgets/team_header.dart';

class AdminTeamPage extends StatelessWidget {
  const AdminTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminTeamBloc>(
      create: (context) =>
          getIt<AdminTeamBloc>()..add(const LoadAdminTeamDataEvent()),
      child: const AdminTeamView(),
    );
  }
}

class AdminTeamView extends StatelessWidget {
  const AdminTeamView({super.key});

  void _showAddStaffDialog(BuildContext context) {
    final bloc = context.read<AdminTeamBloc>();

    showDialog(
      context: context,
      builder: (_) {
        return AddStaffDialog(
          onSave: ({required name, required role, required pin}) {
            bloc.add(AddStaffMemberEvent(name: name, role: role, pin: pin));
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocConsumer<AdminTeamBloc, AdminTeamState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          AppNotificationService.showError(context, state.errorMessage!);
        }
        if (state.successMessage != null) {
          AppNotificationService.showSuccess(context, state.successMessage!);
        }
      },
      builder: (context, state) {
        final isAuditLogTab = state.selectedSubTabIndex == 1;

        return Scaffold(
          backgroundColor: colorScheme.surfaceContainerLow,
          body: SafeArea(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Top Header
                        TeamHeader(isAuditLog: isAuditLogTab),
                        SizedBox(height: 12.h),

                        // 2. Sub-Tab Switcher: Staff vs Audit Log
                        Row(
                          children: [
                            _buildSubTab(
                              context: context,
                              title: AppStrings.staffTab,
                              index: 0,
                              selectedIndex: state.selectedSubTabIndex,
                            ),
                            SizedBox(width: 24.w),
                            _buildSubTab(
                              context: context,
                              title: AppStrings.auditLog,
                              index: 1,
                              selectedIndex: state.selectedSubTabIndex,
                            ),
                          ],
                        ),
                        Divider(
                          height: 1,
                          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                        ),
                        SizedBox(height: 16.h),

                        // 3. Tab Body
                        Expanded(
                          child: isAuditLogTab
                              ? _buildAuditLogView(context, state)
                              : _buildStaffView(context, state),
                        ),
                      ],
                    ),
                  ),
          ),
          floatingActionButton: !isAuditLogTab
              ? FloatingActionButton(
                  onPressed: () => _showAddStaffDialog(context),
                  backgroundColor: theme.primaryColor,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    color: colorScheme.onPrimary,
                    size: 28.r,
                  ),
                )
              : null,
        );
      },
    );
  }

  Widget _buildSubTab({
    required BuildContext context,
    required String title,
    required int index,
    required int selectedIndex,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () {
        context.read<AdminTeamBloc>().add(SwitchTeamTabEvent(index));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected
                  ? colorScheme.onSurface
                  : colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
              fontSize: 14.5.sp,
            ),
          ),
          SizedBox(height: 8.h),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 2.5.h,
            width: isSelected ? 36.w : 0,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ],
      ),
    );
  }

  // View 1: Staff Directory
  Widget _buildStaffView(BuildContext context, AdminTeamState state) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.employeeDirectory,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: colorScheme.onSurface,
                fontSize: 20.sp,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.people_outline_rounded,
                    size: 14.r,
                    color: colorScheme.secondary,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '8 ${AppStrings.activeStaffBadge}',
                    style: textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Staff List
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(bottom: 80.h),
            physics: const BouncingScrollPhysics(),
            itemCount: state.staffList.length,
            separatorBuilder: (_, __) => SizedBox(height: 10.h),
            itemBuilder: (context, index) {
              final staff = state.staffList[index];
              return StaffCard(
                staff: staff,
                onEditPin: () {
                  AppNotificationService.showInfo(
                    context,
                    'Editing PIN for ${staff.name}',
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  // View 2: Audit Log View
  Widget _buildAuditLogView(BuildContext context, AdminTeamState state) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dropdown Filter Chips Row
        Row(
          children: [
            _buildDropdownFilterChip(context, '📅 ${AppStrings.last7Days} ˅'),
            SizedBox(width: 10.w),
            _buildDropdownFilterChip(context, '👤 ${AppStrings.allStaff} ˅'),
          ],
        ),
        SizedBox(height: 16.h),

        // Timeline Log List
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(bottom: 20.h),
            physics: const BouncingScrollPhysics(),
            children: [
              // Group 1: TODAY
              _buildDateGroupBadge(context, 'TODAY - OCT 24, 2023'),
              SizedBox(height: 12.h),

              ...state.auditLogs
                  .where((l) => l.dateGroup.contains('TODAY'))
                  .map((log) => AuditLogTimelineTile(log: log)),

              SizedBox(height: 12.h),
              // Group 2: YESTERDAY
              _buildDateGroupBadge(context, 'YESTERDAY - OCT 23, 2023'),
              SizedBox(height: 12.h),

              ...state.auditLogs
                  .where((l) => l.dateGroup.contains('YESTERDAY'))
                  .map((log) => AuditLogTimelineTile(log: log)),
            ],
          ),
        ),

        // Bottom Export CSV Button
        Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: ElevatedButton.icon(
              onPressed: () {
                AppNotificationService.showSuccess(
                  context,
                  'Audit log exported to CSV!',
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              ),
              icon: Icon(
                Icons.file_download_outlined,
                color: colorScheme.onPrimary,
                size: 18.r,
              ),
              label: Text(
                AppStrings.exportCsv,
                style: textTheme.labelLarge?.copyWith(
                  fontFamily: 'JetBrains Mono',
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onPrimary,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownFilterChip(BuildContext context, String label) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelMedium?.copyWith(
          fontFamily: 'JetBrains Mono',
          color: colorScheme.onSurface,
          fontSize: 12.sp,
        ),
      ),
    );
  }

  Widget _buildDateGroupBadge(BuildContext context, String label) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontFamily: 'JetBrains Mono',
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
              fontSize: 10.5.sp,
            ),
      ),
    );
  }
}
