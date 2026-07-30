import 'package:captin_order/admin/data/datasources/admin_place_datasource.dart';
import 'package:captin_order/admin/domain/entities/admin_floor_plan_entity.dart';
import 'package:captin_order/admin/domain/repositories/admin_place_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failure.dart';

@LazySingleton(as: AdminPlaceRepository)
class AdminPlaceRepositoryImpl implements AdminPlaceRepository {
  final AdminPlaceDataSource _dataSource;

  AdminPlaceRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, AdminFloorPlanEntity>> getFloorPlan() async {
    try {
      final plan = await _dataSource.getFloorPlan();
      return right(plan);
    } catch (e) {
      return left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AdminFloorPlanEntity>> generateBulkTables(int count) async {
    try {
      final plan = await _dataSource.generateBulkTables(count);
      return right(plan);
    } catch (e) {
      return left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AdminFloorPlanEntity>> addZone(String zoneName) async {
    try {
      final plan = await _dataSource.addZone(zoneName);
      return right(plan);
    } catch (e) {
      return left(Failure.serverError(e.toString()));
    }
  }
}
