// lib/features/active_tables/presentation/bloc/active_tables_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/table_entity.dart';

part 'active_tables_state.freezed.dart';

@freezed
class ActiveTablesState with _$ActiveTablesState {
  const factory ActiveTablesState.initial() = _Initial;
  const factory ActiveTablesState.loading() = _Loading;
  const factory ActiveTablesState.loaded({required List<TableEntity> tables}) = _Loaded;
  const factory ActiveTablesState.empty() = _Empty;
  const factory ActiveTablesState.error(String message) = _Error;
}