import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/app_strings.dart';
import '../../domain/repositories/table_details_repository.dart';
import 'table_details_event.dart';
import 'table_details_state.dart';

@injectable
class TableDetailsBloc extends Bloc<TableDetailsEvent, TableDetailsState> {
  final TableDetailsRepository _repository;
  String? _currentTableId;

  TableDetailsBloc(this._repository) : super(const TableDetailsState.loading()) {
    on<LoadDetailsEvent>(_onLoadDetails);
    on<RequestCheckEvent>(_onRequestCheck);
    on<MoveTableEvent>(_onMoveTable);
  }

  Future<void> _onLoadDetails(
    LoadDetailsEvent event,
    Emitter<TableDetailsState> emit,
  ) async {
    _currentTableId = event.tableId;
    emit(const TableDetailsState.loading());
    final result = await _repository.getTableDetails(event.tableId);
    result.fold(
      (failure) => emit( TableDetailsState.error(message: AppStrings.errorMessage)),
      (table) => emit(TableDetailsState.success(table: table)),
    );
  }

  Future<void> _onRequestCheck(
    RequestCheckEvent event,
    Emitter<TableDetailsState> emit,
  ) async {
    if (_currentTableId == null) return;
    if (state is TableDetailsSuccessState) {
      final currentState = state as TableDetailsSuccessState;
      emit(currentState.copyWith(isActionInProgress: true));

      final result = await _repository.requestCheck(_currentTableId!);
      result.fold(
        (failure) => emit(currentState.copyWith(isActionInProgress: false, message: 'Failed to request check.')),
        (updatedTable) => emit(TableDetailsState.success(
          table: updatedTable,
          message: 'Check requested successfully!',
        )),
      );
    }
  }

  Future<void> _onMoveTable(
    MoveTableEvent event,
    Emitter<TableDetailsState> emit,
  ) async {
    if (_currentTableId == null) return;
    if (state is TableDetailsSuccessState) {
      final currentState = state as TableDetailsSuccessState;
      emit(currentState.copyWith(isActionInProgress: true));

      final result = await _repository.moveTable(_currentTableId!, event.newTableNumber);
      result.fold(
        (failure) => emit(currentState.copyWith(isActionInProgress: false, message: 'Failed to move table.')),
        (updatedTable) => emit(TableDetailsState.success(
          table: updatedTable,
          message: 'Table moved to T-${event.newTableNumber.padLeft(2, '0')}',
        )),
      );
    }
  }
}
