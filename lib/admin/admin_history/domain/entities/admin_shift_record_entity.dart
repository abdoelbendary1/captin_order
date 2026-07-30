class AdminShiftRecordEntity {
  final String id;
  final String staffId;
  final String staffName;
  final String role;
  final DateTime date;
  final String shiftName;
  final String startTime;
  final String endTime;
  final double durationHours;
  final double totalSales;
  final int totalOrders;
  final double cashAmount;
  final double cardAmount;

  const AdminShiftRecordEntity({
    required this.id,
    required this.staffId,
    required this.staffName,
    required this.role,
    required this.date,
    required this.shiftName,
    required this.startTime,
    required this.endTime,
    required this.durationHours,
    required this.totalSales,
    required this.totalOrders,
    required this.cashAmount,
    required this.cardAmount,
  });
}
