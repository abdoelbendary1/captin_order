import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/table_entity.dart';

part 'active_tables_state.freezed.dart';

@freezed
class ActiveTablesState with _$ActiveTablesState {
  const factory ActiveTablesState.loading() = LoadingState;
  const factory ActiveTablesState.error({required String message}) = ErrorState;
  const factory ActiveTablesState.success({
    required List<TableEntity> insideTables,
    required List<TableEntity> outsideTables,
    @Default(0) int selectedTabIndex,
    @Default('') String searchQuery,
  }) = SuccessState;
}