import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/admin_menu_item_entity.dart';

part 'admin_menu_event.freezed.dart';

@freezed
abstract class AdminMenuEvent with _$AdminMenuEvent {
  const factory AdminMenuEvent.loadMenu({
    String? categoryId,
  }) = _LoadMenu;

  const factory AdminMenuEvent.selectCategory({
    required String categoryId,
  }) = _SelectCategory;

  const factory AdminMenuEvent.createItem({
    required AdminMenuItemEntity item,
  }) = _CreateItem;
}
