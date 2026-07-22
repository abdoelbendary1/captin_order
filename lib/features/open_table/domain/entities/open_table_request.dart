import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_table_request.freezed.dart';

@freezed 
abstract class OpenTableRequest with _$OpenTableRequest {
  const factory OpenTableRequest({
    required String tableNumber,
    required int guestCount,
    required String areaName,
    String? assignedCaptain,
  }) = _OpenTableRequest;
}