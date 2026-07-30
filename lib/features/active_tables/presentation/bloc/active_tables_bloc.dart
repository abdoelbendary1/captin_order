import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/app_strings.dart';
import '../../domain/entities/table_entity.dart';
import '../../domain/repositories/active_tables_repository.dart';
import 'active_tables_event.dart';
import 'active_tables_state.dart';

@injectable
class ActiveTablesBloc extends Bloc<ActiveTablesEvent, ActiveTablesState> {
  final ActiveTablesRepository _repository;
  List<TableEntity> _allTables = [];

  ActiveTablesBloc(this._repository) : super(const ActiveTablesState.loading()) {
    on<LoadTablesEvent>(_onLoadTables);
    on<RefreshTablesEvent>(_onRefreshTables);
    on<SelectTabEvent>(_onSelectTab);
    on<FilterByStatusEvent>(_onFilterByStatus);
    on<RetryEvent>(_onRetry);
  }

  List<TableEntity> _filterTables(TableLocation location, TableStatusFilter filter) {
    return _allTables.where((t) {
      if (t.location != location) return false;

      switch (filter) {
        case TableStatusFilter.all:
          return true;
        case TableStatusFilter.available:
          return t.status == TableStatus.available;
        case TableStatusFilter.occupied:
          return t.status == TableStatus.occupied || t.status == TableStatus.reserved;
      }
    }).toList();
  }

  (int all, int available, int occupied) _calculateCounts(TableLocation location) {
    final locationTables = _allTables.where((t) => t.location == location);
    final all = locationTables.length;
    final available = locationTables.where((t) => t.status == TableStatus.available).length;
    final occupied = locationTables.where((t) => t.status == TableStatus.occupied || t.status == TableStatus.reserved).length;
    return (all, available, occupied);
  }

  Future<void> _onLoadTables(
    LoadTablesEvent event,
    Emitter<ActiveTablesState> emit,
  ) async {
    emit(const ActiveTablesState.loading());
    final result = await _repository.getActiveTables();
    result.fold(
      (failure) => emit(
        ActiveTablesState.error(message: AppStrings.errorMessage),
      ),
      (tables) {
        _allTables = tables;
        _emitSuccessState(emit, tabIndex: 0, filter: TableStatusFilter.all);
      },
    );
  }

  Future<void> _onRefreshTables(
    RefreshTablesEvent event,
    Emitter<ActiveTablesState> emit,
  ) async {
    final result = await _repository.getActiveTables();
    result.fold(
      (failure) => emit(
        ActiveTablesState.error(message: AppStrings.errorMessage),
      ),
      (tables) {
        _allTables = tables;
        final currentTab = state is SuccessState ? (state as SuccessState).selectedTabIndex : 0;
        final currentFilter = state is SuccessState ? (state as SuccessState).selectedFilter : TableStatusFilter.all;
        _emitSuccessState(emit, tabIndex: currentTab, filter: currentFilter);
      },
    );
  }

  void _onSelectTab(
    SelectTabEvent event,
    Emitter<ActiveTablesState> emit,
  ) {
    if (state is SuccessState) {
      final currentFilter = (state as SuccessState).selectedFilter;
      _emitSuccessState(emit, tabIndex: event.index, filter: currentFilter);
    }
  }

  void _onFilterByStatus(
    FilterByStatusEvent event,
    Emitter<ActiveTablesState> emit,
  ) {
    if (state is SuccessState) {
      final currentTab = (state as SuccessState).selectedTabIndex;
      _emitSuccessState(emit, tabIndex: currentTab, filter: event.filter);
    }
  }

  void _emitSuccessState(
    Emitter<ActiveTablesState> emit, {
    required int tabIndex,
    required TableStatusFilter filter,
  }) {
    final inside = _filterTables(TableLocation.inside, filter);
    final outside = _filterTables(TableLocation.outside, filter);

    final currentLocation = tabIndex == 0 ? TableLocation.inside : TableLocation.outside;
    final (allCount, availableCount, occupiedCount) = _calculateCounts(currentLocation);

    emit(ActiveTablesState.success(
      insideTables: inside,
      outsideTables: outside,
      selectedTabIndex: tabIndex,
      selectedFilter: filter,
      allCount: allCount,
      availableCount: availableCount,
      occupiedCount: occupiedCount,
    ));
  }

  Future<void> _onRetry(
    RetryEvent event,
    Emitter<ActiveTablesState> emit,
  ) async {
    add(const ActiveTablesEvent.loadTables());
  }
}