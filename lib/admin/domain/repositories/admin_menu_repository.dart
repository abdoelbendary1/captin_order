import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../entities/admin_menu_item_entity.dart';

abstract class AdminMenuRepository {
  Future<Either<Failure, List<AdminMenuItemEntity>>> getMenuItems();
  Future<Either<Failure, AdminMenuItemEntity>> addMenuItem(AdminMenuItemEntity item);
}
