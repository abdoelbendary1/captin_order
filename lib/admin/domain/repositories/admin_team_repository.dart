import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../entities/admin_audit_log_entity.dart';
import '../entities/admin_staff_entity.dart';

abstract class AdminTeamRepository {
  Future<Either<Failure, List<AdminStaffEntity>>> getStaffMembers();
  Future<Either<Failure, List<AdminAuditLogEntity>>> getAuditLogs();
  Future<Either<Failure, AdminStaffEntity>> addStaffMember(AdminStaffEntity staff);
}
