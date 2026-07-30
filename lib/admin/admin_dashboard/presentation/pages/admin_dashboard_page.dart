import 'package:captin_order/core/router/app_router.dart';
import 'package:captin_order/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/di/injection.dart';
import '../bloc/admin_dashboard_bloc.dart';
import '../bloc/admin_dashboard_event.dart';
import '../bloc/admin_dashboard_state.dart';
import '../widgets/admin_best_sellers_card.dart';
import '../widgets/admin_header.dart';
import '../widgets/admin_orders_tables_row.dart';
import '../widgets/admin_sales_metrics_card.dart';
import '../widgets/admin_z_reports_card.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminDashboardBloc>(
      create: (context) =>
          getIt<AdminDashboardBloc>()
            ..add(const LoadAdminDashboardMetricsEvent()),
      child: const AdminDashboardView(),
    );
  }
}

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final metrics = state.metrics;
            if (metrics == null) {
              return const Center(child: Text('No admin metrics data.'));
            }

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdminHeader(
                    onLogout: () async {
                      await getIt<AuthRepository>().logout();
                      if (context.mounted) {
                        const LoginRoute().go(context);
                      }
                    },
                  ),
                  SizedBox(height: 12.h),
                  AdminSalesMetricsCard(
                    totalSales: metrics.totalSales,
                    trendPercent: metrics.trendPercent,
                  ),
                  SizedBox(height: 12.h),
                  AdminOrdersTablesRow(
                    totalOrders: metrics.totalOrders,
                    activeTablesCount: metrics.activeTablesCount,
                  ),
                  SizedBox(height: 20.h),
                  AdminBestSellersCard(bestSellers: metrics.bestSellers),
                  SizedBox(height: 20.h),
                  AdminZReportsCard(zReports: metrics.zReports),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
