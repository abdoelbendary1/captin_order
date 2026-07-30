import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/admin_shift_history_repository.dart';
import 'admin_shift_history_event.dart';
import 'admin_shift_history_state.dart';

@injectable
class AdminShiftHistoryBloc
    extends Bloc<AdminShiftHistoryEvent, AdminShiftHistoryState> {
  final AdminShiftHistoryRepository _repository;

  AdminShiftHistoryBloc(this._repository)
      : super(AdminShiftHistoryState.initial()) {
    on<LoadShiftHistoryEvent>(_onLoadShiftHistory);
    on<UpdateDateRangeEvent>(_onUpdateDateRange);
    on<UpdateStaffFilterEvent>(_onUpdateStaffFilter);
    on<DownloadPdfReportEvent>(_onDownloadPdfReport);
  }

  Future<void> _onLoadShiftHistory(
    LoadShiftHistoryEvent event,
    Emitter<AdminShiftHistoryState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final records = await _repository.getShiftRecords(state.filter);
      final summary = await _repository.getShiftSummary(state.filter);
      emit(
        state.copyWith(
          isLoading: false,
          records: records,
          summary: summary,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to load shift history records.',
        ),
      );
    }
  }

  Future<void> _onUpdateDateRange(
    UpdateDateRangeEvent event,
    Emitter<AdminShiftHistoryState> emit,
  ) async {
    final updatedFilter = state.filter.copyWith(dateRange: event.dateRange);
    emit(state.copyWith(filter: updatedFilter));
    add(const LoadShiftHistoryEvent());
  }

  Future<void> _onUpdateStaffFilter(
    UpdateStaffFilterEvent event,
    Emitter<AdminShiftHistoryState> emit,
  ) async {
    final updatedFilter =
        state.filter.copyWith(staffMemberId: event.staffMemberId);
    emit(state.copyWith(filter: updatedFilter));
    add(const LoadShiftHistoryEvent());
  }

  Future<void> _onDownloadPdfReport(
    DownloadPdfReportEvent event,
    Emitter<AdminShiftHistoryState> emit,
  ) async {
    emit(state.copyWith(isExportingPdf: true, pdfExportSuccessMessage: null));
    try {
      final pdfFileName = await _repository.exportShiftReportPdf(state.filter);
      emit(
        state.copyWith(
          isExportingPdf: false,
          pdfExportSuccessMessage:
              'Report generated: $pdfFileName exported successfully!',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isExportingPdf: false,
          errorMessage: 'Failed to export PDF report.',
        ),
      );
    }
  }
}
