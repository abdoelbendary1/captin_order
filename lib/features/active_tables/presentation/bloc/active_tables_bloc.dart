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
    on<SearchTablesEvent>(_onSearchTables);
    on<RetryEvent>(_onRetry);
  }

  List<TableEntity> _filterByLocationAndQuery(TableLocation location, String query) {
    final trimmedQuery = query.toLowerCase().trim();
    return _allTables.where((t) {
      final isActive = t.status == TableStatus.occupied || t.status == TableStatus.reserved;
      final matchesLocation = t.location == location;
      final matchesQuery = trimmedQuery.isEmpty ||
          t.tableNumber.toLowerCase().contains(trimmedQuery) ||
          t.tableCode.toLowerCase().contains(trimmedQuery);
      return isActive && matchesLocation && matchesQuery;
    }).toList();
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
        final inside = _filterByLocationAndQuery(TableLocation.inside, '');
        final outside = _filterByLocationAndQuery(TableLocation.outside, '');
        emit(ActiveTablesState.success(
          insideTables: inside,
          outsideTables: outside,
          selectedTabIndex: 0,
          searchQuery: '',
        ));
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
        final currentQuery = state is SuccessState ? (state as SuccessState).searchQuery : '';
        final inside = _filterByLocationAndQuery(TableLocation.inside, currentQuery);
        final outside = _filterByLocationAndQuery(TableLocation.outside, currentQuery);
        emit(ActiveTablesState.success(
          insideTables: inside,
          outsideTables: outside,
          selectedTabIndex: currentTab,
          searchQuery: currentQuery,
        ));
      },
    );
  }

  void _onSelectTab(
    SelectTabEvent event,
    Emitter<ActiveTablesState> emit,
  ) {
    if (state is SuccessState) {
      final currentState = state as SuccessState;
      emit(currentState.copyWith(
        selectedTabIndex: event.index,
      ));
    }
  }

  void _onSearchTables(
    SearchTablesEvent event,
    Emitter<ActiveTablesState> emit,
  ) {
    if (state is SuccessState) {
      final currentState = state as SuccessState;
      final inside = _filterByLocationAndQuery(TableLocation.inside, event.query);
      final outside = _filterByLocationAndQuery(TableLocation.outside, event.query);
      emit(currentState.copyWith(
        searchQuery: event.query,
        insideTables: inside,
        outsideTables: outside,
      ));
    }
  }

  Future<void> _onRetry(
    RetryEvent event,
    Emitter<ActiveTablesState> emit,
  ) async {
    add(const ActiveTablesEvent.loadTables());
  }
}