// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TableEntity _$TableEntityFromJson(Map<String, dynamic> json) => _TableEntity(
  id: json['id'] as String,
  tableNumber: json['tableNumber'] as String,
  tableCode: json['tableCode'] as String? ?? 'T-00',
  status: $enumDecode(_$TableStatusEnumMap, json['status']),
  location:
      $enumDecodeNullable(_$TableLocationEnumMap, json['location']) ??
      TableLocation.inside,
  guestCount: (json['guestCount'] as num).toInt(),
  currentTotal: (json['currentTotal'] as num).toDouble(),
  timeSeated: json['timeSeated'] as String? ?? '00:00',
  areaName: json['areaName'] as String,
  openedAt: json['openedAt'] == null
      ? null
      : DateTime.parse(json['openedAt'] as String),
  seatedAt: json['seatedAt'] == null
      ? null
      : DateTime.parse(json['seatedAt'] as String),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  timeline:
      (json['timeline'] as List<dynamic>?)
          ?.map((e) => TimelineEvent.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  tableStatusDescription: json['tableStatusDescription'] as String?,
  assignedCaptain: json['assignedCaptain'] as String?,
  capacity: (json['capacity'] as num?)?.toInt() ?? 4,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$TableEntityToJson(_TableEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tableNumber': instance.tableNumber,
      'tableCode': instance.tableCode,
      'status': _$TableStatusEnumMap[instance.status]!,
      'location': _$TableLocationEnumMap[instance.location]!,
      'guestCount': instance.guestCount,
      'currentTotal': instance.currentTotal,
      'timeSeated': instance.timeSeated,
      'areaName': instance.areaName,
      'openedAt': instance.openedAt?.toIso8601String(),
      'seatedAt': instance.seatedAt?.toIso8601String(),
      'items': instance.items,
      'timeline': instance.timeline,
      'tableStatusDescription': instance.tableStatusDescription,
      'assignedCaptain': instance.assignedCaptain,
      'capacity': instance.capacity,
      'notes': instance.notes,
    };

const _$TableStatusEnumMap = {
  TableStatus.occupied: 'occupied',
  TableStatus.reserved: 'reserved',
  TableStatus.available: 'available',
  TableStatus.dirty: 'dirty',
};

const _$TableLocationEnumMap = {
  TableLocation.inside: 'inside',
  TableLocation.outside: 'outside',
};
