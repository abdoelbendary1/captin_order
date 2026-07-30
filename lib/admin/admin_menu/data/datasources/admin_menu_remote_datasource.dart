import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/category_model.dart';
import '../models/menu_item_model.dart';

abstract class AdminMenuRemoteDataSource {
  Future<List<CategoryModel>> getCategories();

  Future<List<MenuItemModel>> getMenuItems({String? categoryId});

  Future<MenuItemModel> createMenuItem(MenuItemModel item);

  Future<MenuItemModel> updateMenuItem(MenuItemModel item);

  Future<void> deleteMenuItem(String id);

  Future<CategoryModel> createCategory(CategoryModel category);

  Future<void> deleteCategory(String id);
}

@LazySingleton(as: AdminMenuRemoteDataSource)
class AdminMenuRemoteDataSourceImpl implements AdminMenuRemoteDataSource {
  final SupabaseClient _supabaseClient;

  AdminMenuRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _supabaseClient
        .from('categories')
        .select()
        .order('display_order', ascending: true);
    return (response as List)
        .map((json) => CategoryModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<MenuItemModel>> getMenuItems({String? categoryId}) async {
    dynamic query = _supabaseClient.from('menu_items').select();
    if (categoryId != null && categoryId.isNotEmpty && categoryId != 'all') {
      query = query.eq('category_id', categoryId);
    }
    final response = await query.order('created_at', ascending: false);
    return (response as List)
        .map((json) => MenuItemModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<MenuItemModel> createMenuItem(MenuItemModel item) async {
    final payload = item.toJson();
    if (item.id.isEmpty) {
      payload.remove('id');
    }
    payload.remove('modifiers');
    final response = await _supabaseClient
        .from('menu_items')
        .insert(payload)
        .select()
        .single();
    return MenuItemModel.fromJson(response);
  }

  @override
  Future<MenuItemModel> updateMenuItem(MenuItemModel item) async {
    final payload = item.toJson();
    payload.remove('modifiers');
    final response = await _supabaseClient
        .from('menu_items')
        .update(payload)
        .eq('id', item.id)
        .select()
        .single();
    return MenuItemModel.fromJson(response);
  }

  @override
  Future<void> deleteMenuItem(String id) async {
    await _supabaseClient.from('menu_items').delete().eq('id', id);
  }

  @override
  Future<CategoryModel> createCategory(CategoryModel category) async {
    final payload = category.toJson();
    if (category.id.isEmpty) {
      payload.remove('id');
    }
    final response = await _supabaseClient
        .from('categories')
        .insert(payload)
        .select()
        .single();
    return CategoryModel.fromJson(response);
  }

  @override
  Future<void> deleteCategory(String id) async {
    await _supabaseClient.from('categories').delete().eq('id', id);
  }
}
