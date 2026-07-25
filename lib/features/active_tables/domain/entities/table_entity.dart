import 'package:freezed_annotation/freezed_annotation.dart';
import 'order_item.dart';
import 'timeline_event.dart';

part 'table_entity.freezed.dart';
part 'table_entity.g.dart';

enum TableStatus { occupied, reserved, available, dirty }
enum TableLocation { inside, outside }

@freezed
abstract class TableEntity with _$TableEntity {
  const factory TableEntity({
    required String id,
    required String tableNumber,
    @Default('T-00') String tableCode,
    required TableStatus status,
    @Default(TableLocation.inside) TableLocation location,
    required int guestCount,
    required double currentTotal,
    @Default('00:00') String timeSeated,
    required String areaName,
    DateTime? openedAt,
    DateTime? seatedAt,
    @Default([]) List<OrderItem> items,
    @Default([]) List<TimelineEvent> timeline,
    String? tableStatusDescription,
    String? assignedCaptain,
    @Default(4) int capacity,
    String? notes,
  }) = _TableEntity;

  factory TableEntity.fromJson(Map<String, dynamic> json) =>
      _$TableEntityFromJson(json);
}