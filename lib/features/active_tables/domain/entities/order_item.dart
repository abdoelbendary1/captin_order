import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item.freezed.dart';

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String id,
    required String name,
    required double price,
    required int quantity,
    String? notes,
  }) = _OrderItem;
}