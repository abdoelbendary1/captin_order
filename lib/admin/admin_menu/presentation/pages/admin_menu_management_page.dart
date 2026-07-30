import 'package:captin_order/core/error/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/datasources/admin_menu_remote_datasource.dart';
import '../../data/repositories/admin_menu_repository_impl.dart';
import '../../domain/cqrs/create_admin_menu_item_command.dart';
import '../../domain/cqrs/get_admin_menu_categories_query.dart';
import '../../domain/cqrs/get_admin_menu_items_query.dart';
import '../../domain/entities/admin_menu_category_entity.dart';
import '../bloc/admin_menu_bloc.dart';
import '../bloc/admin_menu_event.dart';
import '../bloc/admin_menu_state.dart';
import '../widgets/add_menu_item_bottom_sheet.dart';
import '../widgets/admin_menu_category_chips.dart';
import '../widgets/admin_menu_header.dart';
import '../widgets/admin_menu_item_card.dart';

class AdminMenuManagementPage extends StatelessWidget {
  const AdminMenuManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      context.read<AdminMenuBloc>();
      return const AdminMenuManagementView();
    } catch (_) {
      final getIt = GetIt.instance;
      if (getIt.isRegistered<AdminMenuBloc>()) {
        return BlocProvider<AdminMenuBloc>(
          create: (context) => getIt<AdminMenuBloc>()
            ..add(const AdminMenuEvent.loadMenu()),
          child: const AdminMenuManagementView(),
        );
      }
      return BlocProvider<AdminMenuBloc>(
        create: (context) {
          final repo = AdminMenuRepositoryImpl(
            AdminMenuRemoteDataSourceImpl(Supabase.instance.client),
          );
          return AdminMenuBloc(
            GetAdminMenuCategoriesQuery(repo),
            GetAdminMenuItemsQuery(repo),
            CreateAdminMenuItemCommand(repo),
          )..add(const AdminMenuEvent.loadMenu());
        },
        child: const AdminMenuManagementView(),
      );
    }
  }
}

class AdminMenuManagementView extends StatelessWidget {
  const AdminMenuManagementView({super.key});

  void _openAddItemBottomSheet(
    BuildContext context,
    List<AdminMenuCategoryEntity> categories,
  ) {
    final bloc = context.read<AdminMenuBloc>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return BlocProvider.value(
          value: bloc,
          child: AddMenuItemBottomSheet(
            categories: categories,
            onSave: (item) {
              bloc.add(AdminMenuEvent.createItem(item: item));
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: BlocBuilder<AdminMenuBloc, AdminMenuState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: theme.primaryColor,
                  size: 48.r,
                ),
              ),
              error: (failure) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 48.r,
                      color: colorScheme.error,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      failure.displayMessage,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.error,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AdminMenuBloc>().add(
                              const AdminMenuEvent.loadMenu(),
                            );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              loaded: (categories, items, selectedCategoryId) {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
                      child: Column(
                        children: [
                          const AdminMenuHeader(),
                          SizedBox(height: 12.h),
                          AdminMenuCategoryChips(
                            categories: categories,
                            selectedCategoryId: selectedCategoryId,
                            onSelectCategory: (catId) {
                              context.read<AdminMenuBloc>().add(
                                    AdminMenuEvent.selectCategory(
                                      categoryId: catId,
                                    ),
                                  );
                            },
                          ),
                          SizedBox(height: 16.h),
                          Expanded(
                            child: items.isEmpty
                                ? Center(
                                    child: Text(
                                      'No items in this category.',
                                      style: textTheme.bodyMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  )
                                : GridView.builder(
                                    padding: EdgeInsets.only(bottom: 80.h),
                                    physics: const BouncingScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 12.h,
                                      crossAxisSpacing: 12.w,
                                      childAspectRatio: 1.35,
                                    ),
                                    itemCount: items.length,
                                    itemBuilder: (context, index) {
                                      final item = items[index];
                                      return AdminMenuItemCard(item: item);
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 16.w,
                      bottom: 16.h,
                      child: FloatingActionButton(
                        onPressed: () => _openAddItemBottomSheet(
                          context,
                          categories,
                        ),
                        backgroundColor: theme.primaryColor,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Icon(
                          Icons.add_rounded,
                          color: colorScheme.onPrimary,
                          size: 28.r,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
