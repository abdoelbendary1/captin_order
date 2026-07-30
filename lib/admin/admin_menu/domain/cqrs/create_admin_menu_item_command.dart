import 'package:captin_order/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/admin_menu_item_entity.dart';
import '../repositories/admin_menu_repository.dart';

@injectable
class CreateAdminMenuItemCommand {
  final AdminMenuRepository _repository;

  CreateAdminMenuItemCommand(this._repository);

  TaskEither<Failure, AdminMenuItemEntity> execute(
    AdminMenuItemEntity item,
  ) {
    return _repository.createMenuItem(item);
  }
}
