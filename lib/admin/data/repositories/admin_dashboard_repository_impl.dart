import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/admin_metrics_entity.dart';
import '../../domain/repositories/admin_dashboard_repository.dart';
import '../datasources/admin_dashboard_datasource.dart';

@LazySingleton(as: AdminDashboardRepository)
class AdminDashboardRepositoryImpl implements AdminDashboardRepository {
  final AdminDashboardDataSource _dataSource;

  AdminDashboardRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, AdminMetricsEntity>> getAdminDashboardMetrics() async {
    try {
      final metrics = await _dataSource.fetchMetrics();
      return right(metrics);
    } catch (e) {
      return left(Failure.serverError(e.toString()));
    }
  }
}
