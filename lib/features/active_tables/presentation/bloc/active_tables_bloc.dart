// lib/features/active_tables/presentation/bloc/active_tables_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/active_tables_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/table_entity.dart';

import 'active_tables_event.dart';
import 'active_tables_state.dart';

@injectable
class ActiveTablesBloc extends Bloc<ActiveTablesEvent, ActiveTablesState> {
  final ActiveTablesRepository _repository;

  ActiveTablesBloc(this._repository) : super(const ActiveTablesState.initial()) {
    // Listen for the public classes
    on<LoadTables>(_onLoadTables);
    on<RefreshTables>(_onRefreshTables);
  }

  // Update the event type here as well
  Future<void> _onLoadTables(LoadTables event, Emitter<ActiveTablesState> emit) async {
    emit(const ActiveTablesState.loading());
    final result = await _repository.getActiveTables();
    result.fold(
      (failure) => emit(ActiveTablesState.error(failure.toString())),
      (tables) => tables.isEmpty
          ? emit(const ActiveTablesState.empty())
          : emit(ActiveTablesState.loaded(tables: tables)),
    );
  }

  // Update the event type here as well
  Future<void> _onRefreshTables(RefreshTables event, Emitter<ActiveTablesState> emit) async {
    final result = await _repository.getActiveTables();
    result.fold(
      (failure) => emit(ActiveTablesState.error(failure.toString())),
      (tables) => emit(ActiveTablesState.loaded(tables: tables)),
    );
  }
}