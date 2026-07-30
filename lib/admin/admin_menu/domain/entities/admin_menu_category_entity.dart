import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_menu_category_entity.freezed.dart';

@freezed
abstract class AdminMenuCategoryEntity with _$AdminMenuCategoryEntity {
  const factory AdminMenuCategoryEntity({
    required String id,
    required String name,
    required int displayOrder,
  }) = _AdminMenuCategoryEntity;
}
