import 'package:freezed_annotation/freezed_annotation.dart';
import 'order_item.dart';

part 'table_entity.freezed.dart';

enum TableStatus { occupied, reserved, available, dirty }

@freezed
class TableEntity with _$TableEntity {
  const factory TableEntity({
    required String id,
    required String tableNumber,
    required TableStatus status,
    required int guestCount,
    required double currentTotal,
    required DateTime seatedAt,
    required List<OrderItem> items,
    String? assignedCaptain,
    String? areaName,
  }) = _TableEntity;
}