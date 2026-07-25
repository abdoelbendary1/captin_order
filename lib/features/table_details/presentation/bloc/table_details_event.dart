import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_details_event.freezed.dart';

@freezed
class TableDetailsEvent with _$TableDetailsEvent {
  const factory TableDetailsEvent.loadDetails({required String tableId}) = LoadDetailsEvent;
  const factory TableDetailsEvent.requestCheck() = RequestCheckEvent;
  const factory TableDetailsEvent.moveTable({required String newTableNumber}) = MoveTableEvent;
}
