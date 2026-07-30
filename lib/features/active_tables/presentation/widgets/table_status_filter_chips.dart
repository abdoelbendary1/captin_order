import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_strings.dart';
import '../bloc/active_tables_bloc.dart';
import '../bloc/active_tables_event.dart';
import '../bloc/active_tables_state.dart';

class TableStatusFilterChips extends StatelessWidget {
  const TableStatusFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return BlocBuilder<ActiveTablesBloc, ActiveTablesState>(
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType ||
          (previous is SuccessState &&
              current is SuccessState &&
              (previous.selectedFilter != current.selectedFilter ||
                  previous.selectedTabIndex != current.selectedTabIndex ||
                  previous.allCount != current.allCount ||
                  previous.availableCount != current.availableCount ||
                  previous.occupiedCount != current.occupiedCount)),
      builder: (context, state) {
        if (state is! SuccessState) return const SizedBox.shrink();

        final currentFilter = state.selectedFilter;

        final chipsData = [
          (
            filter: TableStatusFilter.all,
            label: AppStrings.filterAll,
            count: state.allCount,
          ),
          (
            filter: TableStatusFilter.available,
            label: AppStrings.filterAvailable,
            count: state.availableCount,
          ),
          (
            filter: TableStatusFilter.occupied,
            label: AppStrings.filterOccupied,
            count: state.occupiedCount,
          ),
        ];

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: chipsData.map((item) {
              final isSelected = currentFilter == item.filter;

              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FilterChip(
                  selected: isSelected,
                  showCheckmark: false,
                  label: Text(
                    '${item.label} (${item.count})',
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected
                          ? colorScheme.onPrimary
                          : colorScheme.onSurfaceVariant,
                    ),
                  ),
                  selectedColor: colorScheme.primary,
                  backgroundColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  side: BorderSide(
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.outlineVariant.withValues(alpha: 0.4),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onSelected: (_) {
                    context.read<ActiveTablesBloc>().add(
                          ActiveTablesEvent.filterByStatus(filter: item.filter),
                        );
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
