import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/services/app_notification_service.dart';
import '../../../../core/theme/theme_context_extension.dart';
import '../bloc/admin_shift_history_bloc.dart';
import '../bloc/admin_shift_history_event.dart';
import '../bloc/admin_shift_history_state.dart';
import '../widgets/shift_history_date_range_picker.dart';
import '../widgets/shift_history_download_pdf_button.dart';
import '../widgets/shift_history_list.dart';
import '../widgets/shift_history_staff_selector.dart';
import '../widgets/shift_history_summary_card.dart';

class AdminShiftHistoryPage extends StatelessWidget {
  const AdminShiftHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminShiftHistoryBloc>(
      create: (context) =>
          getIt<AdminShiftHistoryBloc>()..add(const LoadShiftHistoryEvent()),
      child: const AdminShiftHistoryView(),
    );
  }
}

class AdminShiftHistoryView extends StatelessWidget {
  const AdminShiftHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: BlocConsumer<AdminShiftHistoryBloc, AdminShiftHistoryState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              AppNotificationService.showError(context, state.errorMessage!);
            }
            if (state.pdfExportSuccessMessage != null) {
              AppNotificationService.showSuccess(
                context,
                state.pdfExportSuccessMessage!,
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Title
                  Text(
                    AppStrings.shiftHistoryTitle,
                    style: textTheme.headlineSmall,
                  ),
                  SizedBox(height: 16.h),

                  // UI Section 1: Date Range Picker & Staff Member Selector
                  Row(
                    children: [
                      Expanded(
                        child: ShiftHistoryDateRangePicker(
                          dateRange: state.filter.dateRange,
                          onDateRangeSelected: (range) {
                            context.read<AdminShiftHistoryBloc>().add(
                              UpdateDateRangeEvent(range),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: ShiftHistoryStaffSelector(
                          selectedStaffId: state.filter.staffMemberId,
                          onStaffSelected: (staffId) {
                            context.read<AdminShiftHistoryBloc>().add(
                              UpdateStaffFilterEvent(staffId),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // Handle Loading State or Content
                  if (state.isLoading)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.h),
                      child: const Center(child: CircularProgressIndicator()),
                    )
                  else ...[
                    // UI Section 2: Display Widget of Selection (Responsive Summary Stats)
                    ShiftHistorySummaryCard(summary: state.summary),

                    SizedBox(height: 16.h),

                    // Shift Records List
                    ShiftHistoryList(records: state.records),

                    SizedBox(height: 20.h),

                    // UI Section 3: Download PDF Button
                    ShiftHistoryDownloadPdfButton(
                      isExporting: state.isExportingPdf,
                      onPressed: () {
                        context.read<AdminShiftHistoryBloc>().add(
                          const DownloadPdfReportEvent(),
                        );
                      },
                    ),
                  ],
                  SizedBox(height: 16.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
