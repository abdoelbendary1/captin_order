import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_entity.freezed.dart';

@freezed
abstract class MenuItemEntity with _$MenuItemEntity {
  const factory MenuItemEntity({
    required String id,
    required String name,
    required double price,
    required String category,
  }) = _MenuItemEntity;
}
