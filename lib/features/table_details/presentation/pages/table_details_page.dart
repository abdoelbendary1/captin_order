import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/services/app_notification_service.dart';
import '../bloc/table_details_bloc.dart';
import '../bloc/table_details_event.dart';
import '../bloc/table_details_state.dart';
import '../widgets/order_timeline_view.dart';
import '../widgets/table_action_buttons.dart';
import '../widgets/table_active_order_card.dart';
import '../widgets/table_details_header.dart';
import '../widgets/table_status_banner.dart';

class TableDetailsPage extends StatelessWidget {
  final String tableId;

  const TableDetailsPage({
    super.key,
    required this.tableId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TableDetailsBloc>(
      create: (context) =>
          getIt<TableDetailsBloc>()..add(TableDetailsEvent.loadDetails(tableId: tableId)),
      child: TableDetailsView(tableId: tableId),
    );
  }
}

class TableDetailsView extends StatelessWidget {
  final String tableId;

  const TableDetailsView({
    super.key,
    required this.tableId,
  });

  void _onBack(BuildContext context) {
    const ActiveTablesRoute().go(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocConsumer<TableDetailsBloc, TableDetailsState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            AppNotificationService.showError(context, message);
          },
          success: (_, __, message) {
            if (message != null && message.isNotEmpty) {
              AppNotificationService.showSuccess(context, message);
            }
          },
        );
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              _onBack(context);
            }
          },
          child: Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_rounded, color: colorScheme.onSurface),
                onPressed: () => _onBack(context),
              ),
            ),
            body: SafeArea(
              child: state.map(
                loading: (_) => const Center(child: CircularProgressIndicator()),
                error: (err) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(err.message),
                      const SizedBox(height: 12.0),
                      ElevatedButton(
                        onPressed: () => _onBack(context),
                        child: const Text('Back to Active Tables'),
                      ),
                    ],
                  ),
                ),
                success: (successState) {
                  final table = successState.table;

                  return SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header: Avatar + Table Title + Settings
                        TableDetailsHeader(table: table),
                        const SizedBox(height: 12.0),

                        // Active Order Card (Receipt layout with breakdown)
                        TableActiveOrderCard(table: table),
                        const SizedBox(height: 16.0),

                        // 3 Action Buttons (Add Item, Request Check, Move Table)
                        TableActionButtons(
                          table: table,
                          onAddItem: () async {
                            await OrderItemsRoute(
                              tableNumber: table.tableNumber,
                              areaName: table.areaName,
                            ).push(context);

                            if (context.mounted) {
                              context.read<TableDetailsBloc>().add(
                                    TableDetailsEvent.loadDetails(tableId: tableId),
                                  );
                            }
                          },
                          onRequestCheck: () async {
                            await CheckoutRoute(tableId: table.id).push(context);
                            if (context.mounted) {
                              context.read<TableDetailsBloc>().add(
                                    TableDetailsEvent.loadDetails(tableId: tableId),
                                  );
                            }
                          },
                          onMoveTable: (newTableNumber) {
                            context.read<TableDetailsBloc>().add(
                                  TableDetailsEvent.moveTable(newTableNumber: newTableNumber),
                                );
                          },
                        ),
                        const SizedBox(height: 16.0),

                        // Table Status Banner
                        TableStatusBanner(table: table),
                        const SizedBox(height: 24.0),

                        // Order Timeline Section
                        OrderTimelineView(timeline: table.timeline),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
