import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/services/app_notification_service.dart';
import '../bloc/admin_place_bloc.dart';
import '../bloc/admin_place_event.dart';
import '../bloc/admin_place_state.dart';
import '../widgets/bulk_create_tables_card.dart';
import '../widgets/floor_plan_grid.dart';
import '../widgets/place_header.dart';
import '../widgets/zone_selector_chips.dart';

class AdminPlaceSetupPage extends StatelessWidget {
  const AdminPlaceSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminPlaceBloc>(
      create: (context) =>
          getIt<AdminPlaceBloc>()..add(const LoadAdminFloorPlanEvent()),
      child: const AdminPlaceSetupView(),
    );
  }
}

class AdminPlaceSetupView extends StatelessWidget {
  const AdminPlaceSetupView({super.key});

  void _showAddZoneDialog(BuildContext context) {
    final controller = TextEditingController();
    final bloc = context.read<AdminPlaceBloc>();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Add New Zone'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'e.g. VIP Room, Terrace',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = controller.text.trim();
                if (name.isNotEmpty) {
                  bloc.add(AddZoneEvent(name));
                }
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: BlocConsumer<AdminPlaceBloc, AdminPlaceState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              AppNotificationService.showError(context, state.errorMessage!);
            }
            if (state.successMessage != null) {
              AppNotificationService.showSuccess(context, state.successMessage!);
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final plan = state.floorPlan;
            if (plan == null) {
              return const Center(child: Text('No floor plan data.'));
            }

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 80.h),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Header
                  const PlaceHeader(),
                  SizedBox(height: 12.h),

                  // 2. Zone Selector Chips
                  ZoneSelectorChips(
                    zones: plan.zones,
                    onSelectZone: (zoneId) {
                      context
                          .read<AdminPlaceBloc>()
                          .add(SelectAdminZoneEvent(zoneId));
                    },
                    onAddZone: () => _showAddZoneDialog(context),
                  ),
                  SizedBox(height: 16.h),

                  // 3. Bulk Create Tables Card
                  BulkCreateTablesCard(
                    isGenerating: state.isGenerating,
                    onGenerate: (count) {
                      context
                          .read<AdminPlaceBloc>()
                          .add(GenerateBulkTablesEvent(count));
                    },
                  ),
                  SizedBox(height: 20.h),

                  // 4. Active Floor Plan Grid
                  FloorPlanGrid(
                    tableNumbers: plan.tableNumbers,
                    onAddManualTable: () {
                      final currentCount = plan.tableNumbers.length;
                      context
                          .read<AdminPlaceBloc>()
                          .add(GenerateBulkTablesEvent(currentCount + 1));
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppNotificationService.showSuccess(
            context,
            'Floor plan saved successfully!',
          );
        },
        backgroundColor: theme.primaryColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(
          Icons.save_outlined,
          color: colorScheme.onPrimary,
          size: 26.r,
        ),
      ),
    );
  }
}
