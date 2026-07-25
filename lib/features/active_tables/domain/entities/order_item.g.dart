// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => _OrderItem(
  id: json['id'] as String,
  name: json['name'] as String,
  price: (json['price'] as num).toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$OrderItemToJson(_OrderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'notes': instance.notes,
    };
