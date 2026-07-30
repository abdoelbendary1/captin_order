import 'package:injectable/injectable.dart';
import '../../domain/entities/admin_menu_item_entity.dart';

abstract class AdminMenuDataSource {
  Future<List<AdminMenuItemEntity>> getMenuItems();
  Future<AdminMenuItemEntity> addMenuItem(AdminMenuItemEntity item);
}

@LazySingleton(as: AdminMenuDataSource)
class AdminMenuDataSourceImpl implements AdminMenuDataSource {
  final List<AdminMenuItemEntity> _items = [
    const AdminMenuItemEntity(id: '1', name: 'Spanish Latte', price: 4.50, category: 'Hot Drinks'),
    const AdminMenuItemEntity(id: '2', name: 'Flat White', price: 3.75, category: 'Hot Drinks'),
    const AdminMenuItemEntity(id: '3', name: 'Croissant', price: 3.25, category: 'Bakery'),
    const AdminMenuItemEntity(id: '4', name: 'Iced Americano', price: 3.50, category: 'Cold Drinks'),
    const AdminMenuItemEntity(id: '5', name: 'Blueberry Muffin', price: 3.95, category: 'Bakery'),
    const AdminMenuItemEntity(id: '6', name: 'Espresso', price: 2.50, category: 'Hot Drinks'),
    const AdminMenuItemEntity(id: '7', name: 'Matcha Latte', price: 4.25, category: 'Hot Drinks'),
    const AdminMenuItemEntity(id: '8', name: 'Salted Brownie', price: 3.50, category: 'Bakery'),
  ];

  @override
  Future<List<AdminMenuItemEntity>> getMenuItems() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return List.from(_items);
  }

  @override
  Future<AdminMenuItemEntity> addMenuItem(AdminMenuItemEntity item) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newItem = item.copyWith(id: 'm_${DateTime.now().millisecondsSinceEpoch}');
    _items.add(newItem);
    return newItem;
  }
}
