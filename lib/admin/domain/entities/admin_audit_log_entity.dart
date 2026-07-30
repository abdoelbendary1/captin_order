enum AuditLogBadgeType { refund, orderEdit }

class AdminAuditLogEntity {
  final String id;
  final String time;
  final String dateGroup; // e.g. "TODAY - OCT 24, 2023"
  final String staffName;
  final AuditLogBadgeType badgeType;
  final String description;
  final String? avatarUrl;

  const AdminAuditLogEntity({
    required this.id,
    required this.time,
    required this.dateGroup,
    required this.staffName,
    required this.badgeType,
    required this.description,
    this.avatarUrl,
  });
}
