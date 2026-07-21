// lib/features/active_tables/presentation/bloc/active_tables_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/active_tables_repository.dart';
// import 'active_tables_state.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/table_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'active_tables_event.dart';
import 'active_tables_state.dart';


@injectable
class ActiveTablesBloc extends Bloc<ActiveTablesEvent, ActiveTablesState> {
  final ActiveTablesRepository _repository;

  ActiveTablesBloc(this._repository) : super(const ActiveTablesState.initial()) {
    on<_LoadTables>(_onLoadTables);
    on<_RefreshTables>(_onRefreshTables);
  }

  Future<void> _onLoadTables(_LoadTables event, Emitter<ActiveTablesState> emit) async {
    emit(const ActiveTablesState.loading());
    final result = await _repository.getActiveTables();
    result.fold(
      (failure) => emit(ActiveTablesState.error(failure.toString())),
      (tables) => tables.isEmpty
          ? emit(const ActiveTablesState.empty())
          : emit(ActiveTablesState.loaded(tables: tables)),
    );
  }

  Future<void> _onRefreshTables(_RefreshTables event, Emitter<ActiveTablesState> emit) async {
    final result = await _repository.getActiveTables();
    result.fold(
      (failure) => emit(ActiveTablesState.error(failure.toString())),
      (tables) => emit(ActiveTablesState.loaded(tables: tables)),
    );
  }
}