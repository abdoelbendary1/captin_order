import 'package:flutter/material.dart';
import '../../domain/entities/admin_shift_filter_entity.dart';
import '../../domain/entities/admin_shift_record_entity.dart';
import '../../domain/entities/admin_shift_summary_entity.dart';

class AdminShiftHistoryState {
  final bool isLoading;
  final bool isExportingPdf;
  final AdminShiftFilterEntity filter;
  final List<AdminShiftRecordEntity> records;
  final AdminShiftSummaryEntity summary;
  final String? errorMessage;
  final String? pdfExportSuccessMessage;

  const AdminShiftHistoryState({
    required this.isLoading,
    required this.isExportingPdf,
    required this.filter,
    required this.records,
    required this.summary,
    this.errorMessage,
    this.pdfExportSuccessMessage,
  });

  factory AdminShiftHistoryState.initial() {
    return AdminShiftHistoryState(
      isLoading: false,
      isExportingPdf: false,
      filter: AdminShiftFilterEntity(
        dateRange: DateTimeRange(
          start: DateTime.now().subtract(const Duration(days: 7)),
          end: DateTime.now(),
        ),
        staffMemberId: 'all',
      ),
      records: const [],
      summary: const AdminShiftSummaryEntity(
        totalShifts: 0,
        totalHours: 0.0,
        ordersCompleted: 0,
        salesProcessed: 0.0,
      ),
    );
  }

  AdminShiftHistoryState copyWith({
    bool? isLoading,
    bool? isExportingPdf,
    AdminShiftFilterEntity? filter,
    List<AdminShiftRecordEntity>? records,
    AdminShiftSummaryEntity? summary,
    String? errorMessage,
    String? pdfExportSuccessMessage,
  }) {
    return AdminShiftHistoryState(
      isLoading: isLoading ?? this.isLoading,
      isExportingPdf: isExportingPdf ?? this.isExportingPdf,
      filter: filter ?? this.filter,
      records: records ?? this.records,
      summary: summary ?? this.summary,
      errorMessage: errorMessage,
      pdfExportSuccessMessage: pdfExportSuccessMessage,
    );
  }
}
