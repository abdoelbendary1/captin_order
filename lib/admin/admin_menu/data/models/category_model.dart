import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/admin_menu_category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const CategoryModel._();

  const factory CategoryModel({
    required String id,
    required String name,
    @JsonKey(name: 'display_order') required int displayOrder,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  AdminMenuCategoryEntity toEntity() {
    return AdminMenuCategoryEntity(
      id: id,
      name: name,
      displayOrder: displayOrder,
    );
  }

  factory CategoryModel.fromEntity(AdminMenuCategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      displayOrder: entity.displayOrder,
    );
  }
}
