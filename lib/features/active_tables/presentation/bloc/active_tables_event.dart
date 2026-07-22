// lib/features/active_tables/presentation/bloc/active_tables_event.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_tables_event.freezed.dart';

@freezed
class ActiveTablesEvent with _$ActiveTablesEvent {
  const factory ActiveTablesEvent.loadTables() = LoadTables;
  const factory ActiveTablesEvent.refreshTables() = RefreshTables;
}
