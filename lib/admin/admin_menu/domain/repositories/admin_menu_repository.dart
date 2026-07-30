import 'package:captin_order/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/admin_menu_category_entity.dart';
import '../entities/admin_menu_item_entity.dart';

abstract class AdminMenuRepository {
  TaskEither<Failure, List<AdminMenuCategoryEntity>> getCategories();

  TaskEither<Failure, List<AdminMenuItemEntity>> getMenuItems({
    String? categoryId,
  });

  TaskEither<Failure, AdminMenuItemEntity> createMenuItem(
    AdminMenuItemEntity item,
  );

  TaskEither<Failure, AdminMenuItemEntity> updateMenuItem(
    AdminMenuItemEntity item,
  );

  TaskEither<Failure, Unit> deleteMenuItem(
    String id,
  );

  TaskEither<Failure, AdminMenuCategoryEntity> createCategory(
    AdminMenuCategoryEntity category,
  );

  TaskEither<Failure, Unit> deleteCategory(
    String id,
  );
}
