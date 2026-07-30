import 'package:injectable/injectable.dart';
import '../../domain/entities/admin_shift_filter_entity.dart';
import '../../domain/entities/admin_shift_record_entity.dart';
import '../../domain/entities/admin_shift_summary_entity.dart';
import '../../domain/repositories/admin_shift_history_repository.dart';
import '../datasources/admin_shift_history_remote_datasource.dart';

@LazySingleton(as: AdminShiftHistoryRepository)
class AdminShiftHistoryRepositoryImpl implements AdminShiftHistoryRepository {
  final AdminShiftHistoryRemoteDataSource _remoteDataSource;

  AdminShiftHistoryRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<AdminShiftRecordEntity>> getShiftRecords(
    AdminShiftFilterEntity filter,
  ) {
    return _remoteDataSource.fetchShiftRecords(filter);
  }

  @override
  Future<AdminShiftSummaryEntity> getShiftSummary(
    AdminShiftFilterEntity filter,
  ) {
    return _remoteDataSource.fetchShiftSummary(filter);
  }

  @override
  Future<String> exportShiftReportPdf(
    AdminShiftFilterEntity filter,
  ) {
    return _remoteDataSource.generatePdfReport(filter);
  }
}
