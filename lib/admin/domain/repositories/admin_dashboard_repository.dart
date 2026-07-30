import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../entities/admin_metrics_entity.dart';

abstract class AdminDashboardRepository {
  Future<Either<Failure, AdminMetricsEntity>> getAdminDashboardMetrics();
}
