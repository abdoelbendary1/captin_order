import 'package:injectable/injectable.dart';
import '../../domain/entities/admin_shift_filter_entity.dart';
import '../../domain/entities/admin_shift_record_entity.dart';
import '../../domain/entities/admin_shift_summary_entity.dart';

abstract class AdminShiftHistoryRemoteDataSource {
  Future<List<AdminShiftRecordEntity>> fetchShiftRecords(
    AdminShiftFilterEntity filter,
  );

  Future<AdminShiftSummaryEntity> fetchShiftSummary(
    AdminShiftFilterEntity filter,
  );

  Future<String> generatePdfReport(
    AdminShiftFilterEntity filter,
  );
}

@LazySingleton(as: AdminShiftHistoryRemoteDataSource)
class AdminShiftHistoryRemoteDataSourceImpl
    implements AdminShiftHistoryRemoteDataSource {
  final List<AdminShiftRecordEntity> _mockDatabase = [
    AdminShiftRecordEntity(
      id: 'shift_1',
      staffId: 'staff_1',
      staffName: 'Ahmed M.',
      role: 'Shop Captain',
      date: DateTime.now(),
      shiftName: 'Morning Shift',
      startTime: '08:00 AM',
      endTime: '04:00 PM',
      durationHours: 8.0,
      totalSales: 4250.0,
      totalOrders: 54,
      cashAmount: 2100.0,
      cardAmount: 2150.0,
    ),
    AdminShiftRecordEntity(
      id: 'shift_2',
      staffId: 'staff_2',
      staffName: 'Julian Vane',
      role: 'Barista',
      date: DateTime.now().subtract(const Duration(days: 1)),
      shiftName: 'Evening Shift',
      startTime: '04:00 PM',
      endTime: '12:00 AM',
      durationHours: 8.0,
      totalSales: 3890.0,
      totalOrders: 46,
      cashAmount: 1800.0,
      cardAmount: 2090.0,
    ),
    AdminShiftRecordEntity(
      id: 'shift_3',
      staffId: 'staff_3',
      staffName: 'Lucas Nathan',
      role: 'Store Manager',
      date: DateTime.now().subtract(const Duration(days: 2)),
      shiftName: 'Morning Shift',
      startTime: '08:00 AM',
      endTime: '04:00 PM',
      durationHours: 8.0,
      totalSales: 5120.0,
      totalOrders: 62,
      cashAmount: 2500.0,
      cardAmount: 2620.0,
    ),
    AdminShiftRecordEntity(
      id: 'shift_4',
      staffId: 'staff_4',
      staffName: 'Sarah Manager',
      role: 'Admin',
      date: DateTime.now().subtract(const Duration(days: 3)),
      shiftName: 'Full Shift',
      startTime: '10:00 AM',
      endTime: '06:00 PM',
      durationHours: 8.0,
      totalSales: 4800.0,
      totalOrders: 58,
      cashAmount: 2000.0,
      cardAmount: 2800.0,
    ),
  ];

  @override
  Future<List<AdminShiftRecordEntity>> fetchShiftRecords(
    AdminShiftFilterEntity filter,
  ) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockDatabase.where((record) {
      final matchesStaff = filter.staffMemberId == 'all' ||
          record.staffId == filter.staffMemberId ||
          record.staffName.toLowerCase().contains(filter.staffMemberId.toLowerCase());
      final matchesDate = record.date.isAfter(
            filter.dateRange.start.subtract(const Duration(days: 1)),
          ) &&
          record.date.isBefore(
            filter.dateRange.end.add(const Duration(days: 1)),
          );
      return matchesStaff && matchesDate;
    }).toList();
  }

  @override
  Future<AdminShiftSummaryEntity> fetchShiftSummary(
    AdminShiftFilterEntity filter,
  ) async {
    final records = await fetchShiftRecords(filter);
    final totalShifts = records.length;
    final totalHours = records.fold<double>(
      0.0,
      (sum, r) => sum + r.durationHours,
    );
    final ordersCompleted = records.fold<int>(
      0,
      (sum, r) => sum + r.totalOrders,
    );
    final salesProcessed = records.fold<double>(
      0.0,
      (sum, r) => sum + r.totalSales,
    );

    return AdminShiftSummaryEntity(
      totalShifts: totalShifts,
      totalHours: totalHours,
      ordersCompleted: ordersCompleted,
      salesProcessed: salesProcessed,
    );
  }

  @override
  Future<String> generatePdfReport(
    AdminShiftFilterEntity filter,
  ) async {
    await Future.delayed(const Duration(milliseconds: 600));
    return 'Shift_History_Report_${DateTime.now().millisecondsSinceEpoch}.pdf';
  }
}
