import 'best_seller_entity.dart';
import 'z_report_entity.dart';

class AdminMetricsEntity {
  final double totalSales;
  final double trendPercent;
  final int totalOrders;
  final int activeTablesCount;
  final List<BestSellerEntity> bestSellers;
  final List<ZReportEntity> zReports;

  const AdminMetricsEntity({
    required this.totalSales,
    required this.trendPercent,
    required this.totalOrders,
    required this.activeTablesCount,
    required this.bestSellers,
    required this.zReports,
  });
}
