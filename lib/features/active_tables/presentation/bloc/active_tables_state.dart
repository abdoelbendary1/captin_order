import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/table_entity.dart';

part 'active_tables_state.freezed.dart';

enum TableStatusFilter { all, available, occupied }

@freezed
class ActiveTablesState with _$ActiveTablesState {
  const factory ActiveTablesState.loading() = LoadingState;
  const factory ActiveTablesState.error({required String message}) = ErrorState;
  const factory ActiveTablesState.success({
    required List<TableEntity> insideTables,
    required List<TableEntity> outsideTables,
    @Default(0) int selectedTabIndex,
    @Default(TableStatusFilter.all) TableStatusFilter selectedFilter,
    @Default(0) int allCount,
    @Default(0) int availableCount,
    @Default(0) int occupiedCount,
  }) = SuccessState;
}