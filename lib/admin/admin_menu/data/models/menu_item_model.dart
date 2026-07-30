import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/admin_menu_item_entity.dart';

part 'menu_item_model.freezed.dart';
part 'menu_item_model.g.dart';

@freezed
abstract class MenuItemModel with _$MenuItemModel {
  const MenuItemModel._();

  const factory MenuItemModel({
    required String id,
    @JsonKey(name: 'category_id') required String categoryId,
    required String name,
    String? description,
    required double price,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_available') required bool isAvailable,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    List<String> modifiers,
  }) = _MenuItemModel;

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);

  AdminMenuItemEntity toEntity() {
    return AdminMenuItemEntity(
      id: id,
      categoryId: categoryId,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
      isAvailable: isAvailable,
      modifiers: modifiers,
    );
  }

  factory MenuItemModel.fromEntity(AdminMenuItemEntity entity) {
    return MenuItemModel(
      id: entity.id,
      categoryId: entity.categoryId,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      imageUrl: entity.imageUrl,
      isAvailable: entity.isAvailable,
      modifiers: entity.modifiers,
    );
  }
}
