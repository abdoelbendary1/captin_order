import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/admin_audit_log_entity.dart';
import '../../domain/entities/admin_staff_entity.dart';
import '../../domain/repositories/admin_team_repository.dart';
import '../datasources/admin_team_datasource.dart';

@LazySingleton(as: AdminTeamRepository)
class AdminTeamRepositoryImpl implements AdminTeamRepository {
  final AdminTeamDataSource _dataSource;

  AdminTeamRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<AdminStaffEntity>>> getStaffMembers() async {
    try {
      final staff = await _dataSource.getStaffMembers();
      return right(staff);
    } catch (e) {
      return left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AdminAuditLogEntity>>> getAuditLogs() async {
    try {
      final logs = await _dataSource.getAuditLogs();
      return right(logs);
    } catch (e) {
      return left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AdminStaffEntity>> addStaffMember(
      AdminStaffEntity staff) async {
    try {
      final newStaff = await _dataSource.addStaffMember(staff);
      return right(newStaff);
    } catch (e) {
      return left(Failure.serverError(e.toString()));
    }
  }
}
