import 'package:captin_order/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../entities/admin_menu_category_entity.dart';
import '../repositories/admin_menu_repository.dart';

@injectable
class GetAdminMenuCategoriesQuery {
  final AdminMenuRepository _repository;

  GetAdminMenuCategoriesQuery(this._repository);

  TaskEither<Failure, List<AdminMenuCategoryEntity>> execute() {
    return _repository.getCategories();
  }
}
