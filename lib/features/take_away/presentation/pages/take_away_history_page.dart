import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/data/tables_store.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

class TakeAwayHistoryPage extends StatefulWidget {
  const TakeAwayHistoryPage({super.key});

  @override
  State<TakeAwayHistoryPage> createState() => _TakeAwayHistoryPageState();
}

class _TakeAwayHistoryPageState extends State<TakeAwayHistoryPage> {
  late Future<List<TableEntity>> _ordersFuture;

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  void _loadOrders() {
    setState(() {
      _ordersFuture = getIt<TablesStore>().getTakeawayOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: colorScheme.onSurface, size: 22.r),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Icon(
              Icons.takeout_dining_rounded,
              color: theme.primaryColor,
              size: 22.r,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                '${AppStrings.takeAway} ${AppStrings.navHistory}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<TableEntity>>(
          future: _ordersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final orders = snapshot.data ?? [];

            if (orders.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 64.r,
                      color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'No Take Away orders recorded yet',
                      style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async => _loadOrders(),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                itemCount: orders.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final order = orders[index];
                  final itemsCount = order.items.fold<int>(0, (sum, i) => sum + i.quantity);
                  final timeStr = order.openedAt != null
                      ? '${order.openedAt!.hour.toString().padLeft(2, '0')}:${order.openedAt!.minute.toString().padLeft(2, '0')} PM'
                      : 'Recently';

                  return Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border(
                        left: BorderSide(
                          color: theme.primaryColor,
                          width: 4.w,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: theme.shadowColor.withValues(alpha: 0.04),
                          blurRadius: 6.r,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                '${AppStrings.takeAway} #${order.id.length > 4 ? order.id.substring(order.id.length - 4) : order.id}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.onSurface,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: colorScheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Text(
                                timeStr,
                                style: textTheme.labelSmall?.copyWith(
                                  fontFamily: 'JetBrains Mono',
                                  color: colorScheme.onSecondaryContainer,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '$itemsCount ${AppStrings.itemsSuffix} • ${order.currentTotal.toStringAsFixed(2)} ${AppStrings.currency}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodyMedium?.copyWith(
                            fontFamily: 'JetBrains Mono',
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurfaceVariant,
                            fontSize: 13.5.sp,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () async {
                                await TableDetailsRoute(tableId: order.id).push(context);
                                _loadOrders();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.primaryColor,
                                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                elevation: 0,
                              ),
                              icon: Icon(
                                Icons.receipt_long_outlined,
                                color: colorScheme.onPrimary,
                                size: 16.r,
                              ),
                              label: Text(
                                AppStrings.checkout,
                                style: textTheme.labelMedium?.copyWith(
                                  color: colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
