import 'package:captin_order/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/admin_menu_category_entity.dart';
import '../../domain/entities/admin_menu_item_entity.dart';

part 'admin_menu_state.freezed.dart';

@freezed
abstract class AdminMenuState with _$AdminMenuState {
  const factory AdminMenuState.initial() = _Initial;

  const factory AdminMenuState.loading() = _Loading;

  const factory AdminMenuState.loaded({
    required List<AdminMenuCategoryEntity> categories,
    required List<AdminMenuItemEntity> items,
    String? selectedCategoryId,
  }) = _Loaded;

  const factory AdminMenuState.error({
    required Failure failure,
  }) = _Error;
}
