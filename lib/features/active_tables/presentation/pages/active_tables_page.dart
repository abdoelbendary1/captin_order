import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/injection.dart';
import '../bloc/active_tables_bloc.dart';
import '../bloc/active_tables_event.dart';
import '../bloc/active_tables_state.dart';
import '../widgets/active_tables_app_bar.dart';
import '../widgets/active_tables_fab.dart';
import '../widgets/active_tables_header.dart';
import '../widgets/active_tables_loading_skeleton.dart';
import '../widgets/table_card.dart';

class ActiveTablesPage extends StatelessWidget {
  const ActiveTablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ActiveTablesBloc>()..add(const ActiveTablesEvent.loadTables()),
      child: const Scaffold(
        appBar: ActiveTablesAppBar(),
        floatingActionButton: ActiveTablesFab(),
        body: ActiveTablesBody(),
      ),
    );
  }
}

class ActiveTablesBody extends StatelessWidget {
  const ActiveTablesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          const ActiveTablesHeader(),
          SizedBox(height: 20.h),
          const Expanded(child: ActiveTablesContent()),
        ],
      ),
    );
  }
}

class ActiveTablesContent extends StatelessWidget {
  const ActiveTablesContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocBuilder<ActiveTablesBloc, ActiveTablesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const ActiveTablesLoadingSkeleton(),
          empty: () => Center(
            child: Text(
              AppStrings.noActiveTables,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          error: (message) => _ErrorView(message: message),
          loaded: (tables) => GridView.builder(
            itemCount: tables.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) => TableCard(table: tables[index]),
          ),
        );
      },
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message.isNotEmpty ? message : AppStrings.failedToLoadActiveTables,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 12.h),
          ElevatedButton(
            onPressed: () => context.read<ActiveTablesBloc>().add(
              const ActiveTablesEvent.loadTables(),
            ),
            child: const Text(AppStrings.retry),
          ),
        ],
      ),
    );
  }
}
