import '../entities/admin_shift_filter_entity.dart';
import '../entities/admin_shift_record_entity.dart';
import '../entities/admin_shift_summary_entity.dart';

abstract class AdminShiftHistoryRepository {
  Future<List<AdminShiftRecordEntity>> getShiftRecords(
    AdminShiftFilterEntity filter,
  );

  Future<AdminShiftSummaryEntity> getShiftSummary(
    AdminShiftFilterEntity filter,
  );

  Future<String> exportShiftReportPdf(
    AdminShiftFilterEntity filter,
  );
}
