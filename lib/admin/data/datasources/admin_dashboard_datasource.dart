import 'package:injectable/injectable.dart';
import '../../domain/entities/admin_metrics_entity.dart';
import '../../domain/entities/best_seller_entity.dart';
import '../../domain/entities/z_report_entity.dart';

abstract class AdminDashboardDataSource {
  Future<AdminMetricsEntity> fetchMetrics();
}

@LazySingleton(as: AdminDashboardDataSource)
class AdminDashboardDataSourceImpl implements AdminDashboardDataSource {
  @override
  Future<AdminMetricsEntity> fetchMetrics() async {
    await Future.delayed(const Duration(milliseconds: 300));

    const bestSellers = [
      BestSellerEntity(
        id: 'bs1',
        name: 'Spanish Latte',
        unitsCount: 42,
        progressRatio: 0.85,
      ),
      BestSellerEntity(
        id: 'bs2',
        name: 'Flat White',
        unitsCount: 38,
        progressRatio: 0.72,
      ),
      BestSellerEntity(
        id: 'bs3',
        name: 'Espresso',
        unitsCount: 31,
        progressRatio: 0.58,
      ),
      BestSellerEntity(
        id: 'bs4',
        name: 'Croissant',
        unitsCount: 22,
        progressRatio: 0.42,
      ),
    ];

    const zReports = [
      ZReportEntity(
        id: 'z1',
        date: 'Oct 24, 2023',
        shiftType: 'Evening Shift',
        captainName: 'Sarah M.',
        totalSalesAmount: 1840.50,
      ),
      ZReportEntity(
        id: 'z2',
        date: 'Oct 23, 2023',
        shiftType: 'Morning Shift',
        captainName: 'John D.',
        totalSalesAmount: 2110.25,
      ),
      ZReportEntity(
        id: 'z3',
        date: 'Oct 22, 2023',
        shiftType: 'Evening Shift',
        captainName: 'Sarah M.',
        totalSalesAmount: 1995.00,
      ),
    ];

    return const AdminMetricsEntity(
      totalSales: 2450.00,
      trendPercent: 12.0,
      totalOrders: 158,
      activeTablesCount: 14,
      bestSellers: bestSellers,
      zReports: zReports,
    );
  }
}
