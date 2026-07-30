import 'package:captin_order/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/admin_menu_item_entity.dart';
import '../repositories/admin_menu_repository.dart';

@injectable
class GetAdminMenuItemsQuery {
  final AdminMenuRepository _repository;

  GetAdminMenuItemsQuery(this._repository);

  TaskEither<Failure, List<AdminMenuItemEntity>> execute({
    String? categoryId,
  }) {
    return _repository.getMenuItems(categoryId: categoryId);
  }
}
