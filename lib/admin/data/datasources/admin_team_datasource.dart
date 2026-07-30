import 'package:injectable/injectable.dart';
import '../../domain/entities/admin_audit_log_entity.dart';
import '../../domain/entities/admin_staff_entity.dart';

abstract class AdminTeamDataSource {
  Future<List<AdminStaffEntity>> getStaffMembers();
  Future<List<AdminAuditLogEntity>> getAuditLogs();
  Future<AdminStaffEntity> addStaffMember(AdminStaffEntity staff);
}

@LazySingleton(as: AdminTeamDataSource)
class AdminTeamDataSourceImpl implements AdminTeamDataSource {
  final List<AdminStaffEntity> _staffList = [
    const AdminStaffEntity(
      id: 's1',
      name: 'Marco Rossi',
      role: 'Captain / Barista',
      pin: '••••',
      isActive: true,
    ),
    const AdminStaffEntity(
      id: 's2',
      name: 'Elena Gilbert',
      role: 'Store Manager',
      pin: '••••',
      isActive: true,
    ),
    const AdminStaffEntity(
      id: 's3',
      name: 'Ahmed Khan',
      role: 'Barista',
      pin: '••••',
      isActive: true,
    ),
  ];

  final List<AdminAuditLogEntity> _auditLogs = [
    const AdminAuditLogEntity(
      id: 'l1',
      time: '14:22',
      dateGroup: 'TODAY - OCT 24, 2023',
      staffName: 'Captain Sarah',
      badgeType: AuditLogBadgeType.refund,
      description: 'Refund Issued: Order #4492 (2x Espresso)',
    ),
    const AdminAuditLogEntity(
      id: 'l2',
      time: '13:45',
      dateGroup: 'TODAY - OCT 24, 2023',
      staffName: 'Waiter John',
      badgeType: AuditLogBadgeType.orderEdit,
      description: 'Modified Table Order: Table 08 (Removed: 1x Croissant)',
    ),
    const AdminAuditLogEntity(
      id: 'l3',
      time: '12:10',
      dateGroup: 'TODAY - OCT 24, 2023',
      staffName: 'Manager Mike',
      badgeType: AuditLogBadgeType.refund,
      description: 'Refund Issued: Order #4485 (1x Latte - Cold)',
    ),
    const AdminAuditLogEntity(
      id: 'l4',
      time: '18:50',
      dateGroup: 'YESTERDAY - OCT 23, 2023',
      staffName: 'Captain Sarah',
      badgeType: AuditLogBadgeType.orderEdit,
      description: 'Modified Table Order: Table 12 (Added: 1x Flat White)',
    ),
  ];

  @override
  Future<List<AdminStaffEntity>> getStaffMembers() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return List.from(_staffList);
  }

  @override
  Future<List<AdminAuditLogEntity>> getAuditLogs() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return List.from(_auditLogs);
  }

  @override
  Future<AdminStaffEntity> addStaffMember(AdminStaffEntity staff) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newStaff = staff.copyWith(id: 's_${DateTime.now().millisecondsSinceEpoch}');
    _staffList.add(newStaff);
    return newStaff;
  }
}
