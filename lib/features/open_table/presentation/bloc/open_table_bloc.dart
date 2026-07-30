import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/open_table_repository.dart';
import 'open_table_event.dart';
import 'open_table_state.dart';

@injectable
class OpenTableBloc extends Bloc<OpenTableEvent, OpenTableState> {
  final OpenTableRepository _repository;

  OpenTableBloc(this._repository) : super(const OpenTableState.initial()) {
    on<LoadAvailableTablesEvent>(_onLoadAvailableTables);
    on<SubmitEvent>(_onSubmit);
  }

  Future<void> _onLoadAvailableTables(
    LoadAvailableTablesEvent event,
    Emitter<OpenTableState> emit,
  ) async {
    emit(const OpenTableState.loadingTables());
    final result = await _repository.getAvailableTables(event.location);
    result.fold(
      (failure) => emit(OpenTableState.failure(failure.displayMessage)),
      (tables) => emit(OpenTableState.availableTablesLoaded(availableTables: tables)),
    );
  }

  Future<void> _onSubmit(
    SubmitEvent event,
    Emitter<OpenTableState> emit,
  ) async {
    emit(const OpenTableState.submit());
    final result = await _repository.openTable(
      zone: event.areaName,
      tableNumber: event.tableNumber,
      guestCount: event.guestCount,
      captainName: AppStrings.captainName,
    );

    result.fold(
      (failure) => emit(OpenTableState.failure(failure.displayMessage)),
      (table) => emit(OpenTableState.success(table)),
    );
  }
}