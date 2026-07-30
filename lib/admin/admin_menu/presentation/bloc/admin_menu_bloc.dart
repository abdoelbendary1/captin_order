import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/cqrs/create_admin_menu_item_command.dart';
import '../../domain/cqrs/get_admin_menu_categories_query.dart';
import '../../domain/cqrs/get_admin_menu_items_query.dart';
import '../../domain/entities/admin_menu_item_entity.dart';
import 'admin_menu_event.dart';
import 'admin_menu_state.dart';

@injectable
class AdminMenuBloc extends Bloc<AdminMenuEvent, AdminMenuState> {
  final GetAdminMenuCategoriesQuery _getCategoriesQuery;
  final GetAdminMenuItemsQuery _getMenuItemsQuery;
  final CreateAdminMenuItemCommand _createItemCommand;

  AdminMenuBloc(
    this._getCategoriesQuery,
    this._getMenuItemsQuery,
    this._createItemCommand,
  ) : super(const AdminMenuState.initial()) {
    on<AdminMenuEvent>((event, emit) async {
      await event.when(
        loadMenu: (categoryId) => _onLoadMenu(categoryId, emit),
        selectCategory: (categoryId) => _onSelectCategory(categoryId, emit),
        createItem: (item) => _onCreateItem(item, emit),
      );
    });
  }

  Future<void> _onLoadMenu(
    String? categoryId,
    Emitter<AdminMenuState> emit,
  ) async {
    emit(const AdminMenuState.loading());

    final categoriesResult = await _getCategoriesQuery.execute().run();

    await categoriesResult.fold(
      (failure) async {
        emit(AdminMenuState.error(failure: failure));
      },
      (categories) async {
        final itemsResult = await _getMenuItemsQuery
            .execute(categoryId: categoryId)
            .run();

        itemsResult.fold(
          (failure) => emit(AdminMenuState.error(failure: failure)),
          (items) => emit(
            AdminMenuState.loaded(
              categories: categories,
              items: items,
              selectedCategoryId: categoryId,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onSelectCategory(
    String categoryId,
    Emitter<AdminMenuState> emit,
  ) async {
    await state.maybeMap(
      loaded: (loadedState) async {
        final itemsResult = await _getMenuItemsQuery
            .execute(categoryId: categoryId)
            .run();

        itemsResult.fold(
          (failure) => emit(AdminMenuState.error(failure: failure)),
          (items) => emit(
            loadedState.copyWith(
              items: items,
              selectedCategoryId: categoryId,
            ),
          ),
        );
      },
      orElse: () async {
        add(AdminMenuEvent.loadMenu(categoryId: categoryId));
      },
    );
  }

  Future<void> _onCreateItem(
    AdminMenuItemEntity item,
    Emitter<AdminMenuState> emit,
  ) async {
    final result = await _createItemCommand.execute(item).run();

    result.fold(
      (failure) => emit(AdminMenuState.error(failure: failure)),
      (_) => add(const AdminMenuEvent.loadMenu()),
    );
  }
}
