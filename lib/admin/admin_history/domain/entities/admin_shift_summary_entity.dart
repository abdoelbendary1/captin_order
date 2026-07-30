class AdminShiftSummaryEntity {
  final int totalShifts;
  final double totalHours;
  final int ordersCompleted;
  final double salesProcessed;

  const AdminShiftSummaryEntity({
    required this.totalShifts,
    required this.totalHours,
    required this.ordersCompleted,
    required this.salesProcessed,
  });
}
