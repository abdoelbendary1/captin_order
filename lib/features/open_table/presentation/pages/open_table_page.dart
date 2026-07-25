import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/services/app_notification_service.dart';
import '../../../active_tables/domain/entities/table_entity.dart';
import '../bloc/open_table_bloc.dart';
import '../bloc/open_table_event.dart';
import '../bloc/open_table_state.dart';
import '../widgets/open_table_grid_tile.dart';
import '../widgets/open_table_proceed_button.dart';
import '../widgets/open_table_zone_toggle.dart';

class OpenTablePage extends StatelessWidget {
  const OpenTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OpenTableBloc>(
      create: (context) => getIt<OpenTableBloc>()
        ..add(const OpenTableEvent.loadAvailableTables(location: TableLocation.inside)),
      child: const OpenTableView(),
    );
  }
}

class OpenTableView extends StatefulWidget {
  const OpenTableView({super.key});

  @override
  State<OpenTableView> createState() => _OpenTableViewState();
}

class _OpenTableViewState extends State<OpenTableView> {
  int _selectedZoneIndex = 0; // 0 for INDOOR, 1 for OUTDOOR
  String? _selectedTableNumber;
  List<TableEntity> _availableTables = [];

  void _onZoneSelected(int index) {
    if (_selectedZoneIndex == index) return;
    setState(() {
      _selectedZoneIndex = index;
      _selectedTableNumber = null;
    });
    final location = index == 0 ? TableLocation.inside : TableLocation.outside;
    context.read<OpenTableBloc>().add(OpenTableEvent.loadAvailableTables(location: location));
  }

  String _getAreaName() {
    return _selectedZoneIndex == 0 ? AppStrings.insideHall : AppStrings.outsidePatio;
  }

  void _onProceed(BuildContext context) {
    if (_selectedTableNumber == null) {
      AppNotificationService.showWarning(context, AppStrings.selectAvailableTableWarning);
      return;
    }

    final areaName = _getAreaName();

    context.read<OpenTableBloc>().add(
          OpenTableEvent.submit(
            tableNumber: _selectedTableNumber!,
            guestCount: 2,
            areaName: areaName,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return BlocConsumer<OpenTableBloc, OpenTableState>(
      listener: (context, state) {
        state.whenOrNull(
          availableTablesLoaded: (tables) {
            setState(() {
              _availableTables = tables;
              if (tables.isNotEmpty && _selectedTableNumber == null) {
                _selectedTableNumber = tables.first.tableNumber;
              }
            });
          },
          success: (table) async {
            AppNotificationService.showSuccess(
              context,
              'Table ${table.tableNumber} ${AppStrings.tableOpenedSuccess}',
            );

            await OrderItemsRoute(
              tableNumber: table.tableNumber,
              areaName: table.areaName,
            ).push(context);

            if (context.mounted) {
              TableDetailsRoute(tableId: table.id).go(context);
            }
          },
          failure: (message) {
            AppNotificationService.showError(context, message);
          },
        );
      },
      builder: (context, state) {
        final isSubmitting = state is Submit;
        final isLoadingTables = state is LoadingTablesState;

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: Text(
              AppStrings.openNewTableTitle,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.close_rounded, color: colorScheme.onSurface),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: 8.h),

              // 1. Zone Toggle Switch (INDOOR / OUTDOOR)
              OpenTableZoneToggle(
                selectedZoneIndex: _selectedZoneIndex,
                onZoneSelected: _onZoneSelected,
              ),

              SizedBox(height: 16.h),

              // Subtitle Banner: Available Tables Only
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.availableTablesOnly,
                      style: textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                        color: theme.primaryColor,
                        fontSize: 10.5,
                      ),
                    ),
                    Text(
                      '${_availableTables.length} ${AppStrings.availableCountSuffix}',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12.h),

              // 2. Available Tables Grid
              Expanded(
                child: isLoadingTables
                    ? const Center(child: CircularProgressIndicator())
                    : _availableTables.isEmpty
                        ? Center(
                            child: Padding(
                              padding: EdgeInsets.all(24.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.table_restaurant_outlined,
                                    size: 48.r,
                                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    '${AppStrings.noAvailableTablesInArea} ${_getAreaName()}',
                                    style: textTheme.titleSmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    AppStrings.allTablesOccupiedNotice,
                                    textAlign: TextAlign.center,
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : GridView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                            physics: const BouncingScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 12.w,
                              mainAxisSpacing: 12.h,
                              childAspectRatio: 1.0,
                            ),
                            itemCount: _availableTables.length,
                            itemBuilder: (context, index) {
                              final table = _availableTables[index];
                              final isSelected = _selectedTableNumber == table.tableNumber;

                              return OpenTableGridTile(
                                tableNumber: table.tableNumber,
                                isSelected: isSelected,
                                onTap: () {
                                  setState(() {
                                    _selectedTableNumber = table.tableNumber;
                                  });
                                },
                              );
                            },
                          ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
          bottomNavigationBar: OpenTableProceedButton(
            isSubmitting: isSubmitting,
            onPressed: () => _onProceed(context),
          ),
        );
      },
    );
  }
}