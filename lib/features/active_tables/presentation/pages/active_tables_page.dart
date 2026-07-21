import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/di/injection.dart';
import '../bloc/active_tables_bloc.dart';
import '../bloc/active_tables_event.dart';
import '../bloc/active_tables_state.dart';
import '../widgets/table_card.dart';

class ActiveTablesPage extends StatelessWidget {
  const ActiveTablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ActiveTablesBloc>()..add(const ActiveTablesEvent.loadTables()),
      child: const ActiveTablesView(),
    );
  }
}

class ActiveTablesView extends StatelessWidget {
  const ActiveTablesView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: colorScheme.primaryContainer,
              child: const Icon(Icons.storefront_rounded),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shop Captain',
                  style: theme.textTheme.headlineSmall?.copyWith(fontSize: 18.sp),
                ),
                Row(
                  children: [
                    Icon(Icons.wb_sunny_outlined, size: 12.r, color: colorScheme.onSurface.withOpacity(0.6)),
                    SizedBox(width: 4.w),
                    Text(
                      'Morning Shift',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                        color: colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
          SizedBox(width: 8.w),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: colorScheme.secondaryContainer,
        child: Icon(Icons.add, color: colorScheme.onSecondaryContainer),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.spaceSm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.spaceSm),
            Text(
              'Active Tables',
              style: theme.textTheme.displayLarge?.copyWith(fontSize: 28.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              'Main Dining Area Overview',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            SizedBox(height: AppSize.spaceSm),
            Expanded(
              child: BlocBuilder<ActiveTablesBloc, ActiveTablesState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    empty: () => Center(
                      child: Text('No active tables right now.', style: theme.textTheme.bodyMedium),
                    ),
                    error: (message) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Failed to load active tables.', style: theme.textTheme.bodyMedium),
                          SizedBox(height: 8.h),
                          ElevatedButton(
                            onPressed: () => context
                                .read<ActiveTablesBloc>()
                                .add(const ActiveTablesEvent.loadTables()),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                    loaded: (tables) => GridView.builder(
                      itemCount: tables.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppSize.spaceSm,
                        mainAxisSpacing: AppSize.spaceSm,
                        childAspectRatio: 0.95,
                      ),
                      itemBuilder: (context, index) {
                        return TableCard(table: tables[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}