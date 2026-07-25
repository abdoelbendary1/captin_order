import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../active_tables/domain/entities/table_entity.dart';

part 'open_table_event.freezed.dart';

@freezed
class OpenTableEvent with _$OpenTableEvent {
  const factory OpenTableEvent.loadAvailableTables({required TableLocation location}) = LoadAvailableTablesEvent;
  const factory OpenTableEvent.submit({
    required String tableNumber,
    required int guestCount,
    required String areaName,
  }) = SubmitEvent;
}