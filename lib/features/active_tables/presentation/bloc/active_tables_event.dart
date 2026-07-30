import 'package:freezed_annotation/freezed_annotation.dart';
import 'active_tables_state.dart';

part 'active_tables_event.freezed.dart';

@freezed
class ActiveTablesEvent with _$ActiveTablesEvent {
  const factory ActiveTablesEvent.loadTables() = LoadTablesEvent;
  const factory ActiveTablesEvent.refreshTables() = RefreshTablesEvent;
  const factory ActiveTablesEvent.selectTab({required int index}) = SelectTabEvent;
  const factory ActiveTablesEvent.filterByStatus({required TableStatusFilter filter}) = FilterByStatusEvent;
  const factory ActiveTablesEvent.retry() = RetryEvent;
}
