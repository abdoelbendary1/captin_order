import 'package:captin_order/core/constants/api_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/open_table_request.dart';
import 'open_table_event.dart';
import 'open_table_state.dart';

@injectable
class OpenTableBloc extends Bloc<OpenTableEvent, OpenTableState> {
  final OpenTableRepository _repository;

  OpenTableBloc(this._repository) : super(const OpenTableState.initial()) {
    on<Submit>(_onSubmit);
  }

  Future<void> _onSubmit(Submit event, Emitter<OpenTableState> emit) async {
    emit(const OpenTableState.submitting());

    final request = OpenTableRequest(
      tableNumber: event.tableNumber,
      guestCount: event.guestCount,
      areaName: event.areaName,
    );

    final result = await _repository.openTable(request);

    result.fold(
      (failure) => emit(OpenTableState.failure(failure.toString())),
      (table) => emit(OpenTableState.success(table)),
    );
  }
}