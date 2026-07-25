import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

part 'open_table_state.freezed.dart';

@freezed
class OpenTableState with _$OpenTableState {
  const factory OpenTableState.initial() = Initial;
  const factory OpenTableState.loadingTables() = LoadingTablesState;
  const factory OpenTableState.availableTablesLoaded({
    required List<TableEntity> availableTables,
  }) = AvailableTablesLoadedState;
  const factory OpenTableState.submit() = Submit;
  const factory OpenTableState.success(TableEntity table) = Success;
  const factory OpenTableState.failure(String message) = FailureState;
}