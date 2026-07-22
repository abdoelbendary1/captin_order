import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

part 'open_table_state.freezed.dart';

@freezed
class OpenTableState with _$OpenTableState {
  const factory OpenTableState.initial() = _Initial;
  const factory OpenTableState.submitting() = _Submitting;
  const factory OpenTableState.success(TableEntity table) = _Success;
  const factory OpenTableState.failure(String message) = _Failure;
}