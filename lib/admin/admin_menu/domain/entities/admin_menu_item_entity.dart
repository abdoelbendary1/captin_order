import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_menu_item_entity.freezed.dart';

@freezed
abstract class AdminMenuItemEntity with _$AdminMenuItemEntity {
  const factory AdminMenuItemEntity({
    required String id,
    required String categoryId,
    required String name,
    String? description,
    required double price,
    String? imageUrl,
    required bool isAvailable,
    @Default([]) List<String> modifiers,
  }) = _AdminMenuItemEntity;
}
