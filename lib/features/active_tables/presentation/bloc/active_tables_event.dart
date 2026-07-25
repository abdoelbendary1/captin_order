import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_tables_event.freezed.dart';

@freezed
class ActiveTablesEvent with _$ActiveTablesEvent {
  const factory ActiveTablesEvent.loadTables() = LoadTablesEvent;
  const factory ActiveTablesEvent.refreshTables() = RefreshTablesEvent;
  const factory ActiveTablesEvent.selectTab({required int index}) = SelectTabEvent;
  const factory ActiveTablesEvent.searchTables({required String query}) = SearchTablesEvent;
  const factory ActiveTablesEvent.retry() = RetryEvent;
}
