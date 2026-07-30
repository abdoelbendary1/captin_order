import 'package:captin_order/core/error/error_handler.dart';
import 'package:captin_order/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/admin_menu_category_entity.dart';
import '../../domain/entities/admin_menu_item_entity.dart';
import '../../domain/repositories/admin_menu_repository.dart';
import '../datasources/admin_menu_remote_datasource.dart';
import '../models/category_model.dart';
import '../models/menu_item_model.dart';

@LazySingleton(as: AdminMenuRepository)
class AdminMenuRepositoryImpl implements AdminMenuRepository {
  final AdminMenuRemoteDataSource _remoteDataSource;

  AdminMenuRepositoryImpl(this._remoteDataSource);

  @override
  TaskEither<Failure, List<AdminMenuCategoryEntity>> getCategories() {
    return TaskEither.tryCatch(
      () async {
        final models = await _remoteDataSource.getCategories();
        return models.map((m) => m.toEntity()).toList();
      },
      (error, stackTrace) => ErrorHandler.handle(error),
    );
  }

  @override
  TaskEither<Failure, List<AdminMenuItemEntity>> getMenuItems({
    String? categoryId,
  }) {
    return TaskEither.tryCatch(
      () async {
        final models =
            await _remoteDataSource.getMenuItems(categoryId: categoryId);
        return models.map((m) => m.toEntity()).toList();
      },
      (error, stackTrace) => ErrorHandler.handle(error),
    );
  }

  @override
  TaskEither<Failure, AdminMenuItemEntity> createMenuItem(
    AdminMenuItemEntity item,
  ) {
    return TaskEither.tryCatch(
      () async {
        final model = MenuItemModel.fromEntity(item);
        final created = await _remoteDataSource.createMenuItem(model);
        return created.toEntity();
      },
      (error, stackTrace) => ErrorHandler.handle(error),
    );
  }

  @override
  TaskEither<Failure, AdminMenuItemEntity> updateMenuItem(
    AdminMenuItemEntity item,
  ) {
    return TaskEither.tryCatch(
      () async {
        final model = MenuItemModel.fromEntity(item);
        final updated = await _remoteDataSource.updateMenuItem(model);
        return updated.toEntity();
      },
      (error, stackTrace) => ErrorHandler.handle(error),
    );
  }

  @override
  TaskEither<Failure, Unit> deleteMenuItem(String id) {
    return TaskEither.tryCatch(
      () async {
        await _remoteDataSource.deleteMenuItem(id);
        return unit;
      },
      (error, stackTrace) => ErrorHandler.handle(error),
    );
  }

  @override
  TaskEither<Failure, AdminMenuCategoryEntity> createCategory(
    AdminMenuCategoryEntity category,
  ) {
    return TaskEither.tryCatch(
      () async {
        final model = CategoryModel.fromEntity(category);
        final created = await _remoteDataSource.createCategory(model);
        return created.toEntity();
      },
      (error, stackTrace) => ErrorHandler.handle(error),
    );
  }

  @override
  TaskEither<Failure, Unit> deleteCategory(String id) {
    return TaskEither.tryCatch(
      () async {
        await _remoteDataSource.deleteCategory(id);
        return unit;
      },
      (error, stackTrace) => ErrorHandler.handle(error),
    );
  }
}
