import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/admin_menu_item_entity.dart';
import '../../domain/repositories/admin_menu_repository.dart';
import '../datasources/admin_menu_datasource.dart';

@LazySingleton(as: AdminMenuRepository)
class AdminMenuRepositoryImpl implements AdminMenuRepository {
  final AdminMenuDataSource _dataSource;

  AdminMenuRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<AdminMenuItemEntity>>> getMenuItems() async {
    try {
      final items = await _dataSource.getMenuItems();
      return right(items);
    } catch (e) {
      return left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AdminMenuItemEntity>> addMenuItem(
    AdminMenuItemEntity item,
  ) async {
    try {
      final created = await _dataSource.addMenuItem(item);
      return right(created);
    } catch (e) {
      return left(Failure.serverError(e.toString()));
    }
  }
}
