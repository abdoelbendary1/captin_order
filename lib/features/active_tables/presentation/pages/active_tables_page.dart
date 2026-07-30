import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../bloc/active_tables_bloc.dart';
import '../bloc/active_tables_event.dart';
import '../bloc/active_tables_state.dart';
import '../widgets/custom_header.dart';
import '../widgets/table_status_filter_chips.dart';
import '../widgets/error_view.dart';
import '../widgets/segmented_toggle_tab.dart';
import '../widgets/shimmer_loading_view.dart';
import '../widgets/tables_grid_view.dart';

import '../bloc/ticker_cubit.dart';

class ActiveTablesPage extends StatelessWidget {
  const ActiveTablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ActiveTablesBloc>(
          create: (context) =>
              getIt<ActiveTablesBloc>()..add(const ActiveTablesEvent.loadTables()),
        ),
        BlocProvider<TickerCubit>(
          create: (context) => getIt<TickerCubit>(),
        ),
      ],
      child: const ActiveTablesView(),
    );
  }
}

class ActiveTablesView extends StatefulWidget {
  const ActiveTablesView({super.key});

  @override
  State<ActiveTablesView> createState() => _ActiveTablesViewState();
}

class _ActiveTablesViewState extends State<ActiveTablesView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ActiveTablesBloc>().add(const ActiveTablesEvent.refreshTables());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) {
    if (_pageController.hasClients && _pageController.page?.round() != index) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
    }
    context.read<ActiveTablesBloc>().add(
          ActiveTablesEvent.selectTab(index: index),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Auto refresh active tables on build to capture table closures and new orders
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<ActiveTablesBloc>().add(const ActiveTablesEvent.refreshTables());
      }
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Custom Header (Always visible)
            const CustomHeader(),

            // 2. Segmented Toggle Tab with fluid sliding indicator
            BlocBuilder<ActiveTablesBloc, ActiveTablesState>(
              buildWhen: (previous, current) =>
                  previous.runtimeType != current.runtimeType ||
                  (previous is SuccessState &&
                      current is SuccessState &&
                      previous.selectedTabIndex != current.selectedTabIndex),
              builder: (context, state) {
                final selectedIndex =
                    state is SuccessState ? state.selectedTabIndex : 0;
                return SegmentedToggleTab(
                  selectedIndex: selectedIndex,
                  onTabSelected: _onTabSelected,
                );
              },
            ),

            // 3. Status Filter Chips (All, Available, Occupied with counts)
            const TableStatusFilterChips(),

            // 4. Swipeable PageView Cards Content Area
            Expanded(
              child: BlocConsumer<ActiveTablesBloc, ActiveTablesState>(
                listenWhen: (previous, current) =>
                    previous is SuccessState &&
                    current is SuccessState &&
                    previous.selectedTabIndex != current.selectedTabIndex,
                listener: (context, state) {
                  if (state is SuccessState) {
                    if (_pageController.hasClients &&
                        _pageController.page?.round() != state.selectedTabIndex) {
                      _pageController.animateToPage(
                        state.selectedTabIndex,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutCubic,
                      );
                    }
                  }
                },
                builder: (context, state) {
                  return state.map(
                    loading: (_) => const ShimmerLoadingView(),
                    error: (errorState) => ErrorView(
                      message: errorState.message,
                      onRetry: () {
                        context.read<ActiveTablesBloc>().add(
                              const ActiveTablesEvent.retry(),
                            );
                      },
                    ),
                    success: (successState) => PageView(
                      controller: _pageController,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (index) {
                        context.read<ActiveTablesBloc>().add(
                              ActiveTablesEvent.selectTab(index: index),
                            );
                      },
                      children: [
                        // Page 0: Inside Tables
                        TablesGridView(tables: successState.insideTables),
                        // Page 1: Outside Tables
                        TablesGridView(tables: successState.outsideTables),
                      ],
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
