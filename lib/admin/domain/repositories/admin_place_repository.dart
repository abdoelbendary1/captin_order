import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../entities/admin_floor_plan_entity.dart';

abstract class AdminPlaceRepository {
  Future<Either<Failure, AdminFloorPlanEntity>> getFloorPlan();
  Future<Either<Failure, AdminFloorPlanEntity>> generateBulkTables(int count);
  Future<Either<Failure, AdminFloorPlanEntity>> addZone(String zoneName);
}
