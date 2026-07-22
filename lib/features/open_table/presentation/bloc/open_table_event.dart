import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_table_event.freezed.dart';

@freezed
abstract class OpenTableEvent with _$OpenTableEvent {
  const factory OpenTableEvent.submit({
    required String tableNumber,
    required int guestCount,
    required String areaName,
  }) = Submit;
}