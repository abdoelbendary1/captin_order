import 'package:captin_order/admin/domain/entities/admin_audit_log_entity.dart';
import 'package:captin_order/admin/domain/entities/admin_staff_entity.dart';


class AdminTeamState {
  final bool isLoading;
  final int selectedSubTabIndex; // 0 for Staff, 1 for Audit Log
  final List<AdminStaffEntity> staffList;
  final List<AdminAuditLogEntity> auditLogs;
  final String? errorMessage;
  final String? successMessage;

  const AdminTeamState({
    this.isLoading = false,
    this.selectedSubTabIndex = 0,
    this.staffList = const [],
    this.auditLogs = const [],
    this.errorMessage,
    this.successMessage,
  });

  AdminTeamState copyWith({
    bool? isLoading,
    int? selectedSubTabIndex,
    List<AdminStaffEntity>? staffList,
    List<AdminAuditLogEntity>? auditLogs,
    String? errorMessage,
    String? successMessage,
  }) {
    return AdminTeamState(
      isLoading: isLoading ?? this.isLoading,
      selectedSubTabIndex: selectedSubTabIndex ?? this.selectedSubTabIndex,
      staffList: staffList ?? this.staffList,
      auditLogs: auditLogs ?? this.auditLogs,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}
