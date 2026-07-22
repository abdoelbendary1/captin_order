import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/injection.dart';
import '../bloc/open_table_bloc.dart';
import '../bloc/open_table_event.dart';
import '../widgets/guest_count_grid.dart';
import '../widgets/server_selector.dart';
import '../widgets/table_number_grid.dart';
import '../widgets/zone_selector.dart';

class OpenTablePage extends StatelessWidget {
  const OpenTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return BlocProvider(
      create: (context) => getIt<OpenTableBloc>(),
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          elevation: 0,
          title: Text(
            AppStrings.openNewTableTitle,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.close, color: theme.colorScheme.onSurface),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        body: const OpenTableBody(),
        bottomNavigationBar: const _ProceedButton(),
      ),
    );
  }
}

class OpenTableBody extends StatelessWidget {
  const OpenTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(title: AppStrings.zoneSelector),
          const ZoneSelector(),
          SizedBox(height: 24.h),
          
          const _SectionHeader(title: AppStrings.availableTablesInZone),
          const TableNumberGrid(),
          SizedBox(height: 24.h),
          
          const _SectionHeader(title: AppStrings.guestCountLabel),
          const GuestCountGrid(),
          SizedBox(height: 24.h),
          
          const _SectionHeader(title: AppStrings.serverLabel),
          const ServerSelector(),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          letterSpacing: 1.5,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _ProceedButton extends StatelessWidget {
  const _ProceedButton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(top: BorderSide(color: theme.colorScheme.outlineVariant)),
      ),
      child: SafeArea(
        child: ElevatedButton(
          onPressed: () {
            // Trigger Bloc Event to save and navigate
            // context.read<OpenTableBloc>().add(SubmitOpenTableEvent());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E1A10), // Matches dark brown in design
            padding: EdgeInsets.symmetric(vertical: 18.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.proceedToOrder,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(Icons.arrow_forward, color: Colors.white, size: 20.r),
            ],
          ),
        ),
      ),
    );
  }
}