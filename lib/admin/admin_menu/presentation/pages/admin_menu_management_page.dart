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
import '../../domain/entities/admin_menu_item_entity.dart';
import '../bloc/admin_menu_bloc.dart';
import '../bloc/admin_menu_event.dart';
import '../bloc/admin_menu_state.dart';
import '../widgets/add_menu_item_bottom_sheet.dart';
import '../widgets/admin_menu_category_chips.dart';
import '../widgets/admin_menu_error_view.dart';
import '../widgets/admin_menu_grid.dart';
import '../widgets/admin_menu_header.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
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
              error: (failure) => AdminMenuErrorView(
                errorMessage: failure.displayMessage,
                onRetry: () {
                  context.read<AdminMenuBloc>().add(
                        const AdminMenuEvent.loadMenu(),
                      );
                },
              ),
              loaded: (categories, items, selectedCategoryId) {
                return _AdminMenuLoadedView(
                  categories: categories,
                  items: items,
                  selectedCategoryId: selectedCategoryId,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _AdminMenuLoadedView extends StatelessWidget {
  final List<AdminMenuCategoryEntity> categories;
  final List<AdminMenuItemEntity> items;
  final String? selectedCategoryId;

  const _AdminMenuLoadedView({
    required this.categories,
    required this.items,
    required this.selectedCategoryId,
  });

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
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AdminMenuHeader(),
              SizedBox(height: 16.h),
              Text(
                'Menu Management',
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: const Color(0xFF1E150F),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Manage your daily offerings and modifiers.',
                style: textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF7C6E65),
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 16.h),
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
                child: AdminMenuGrid(items: items),
              ),
            ],
          ),
        ),
        Positioned(
          right: 20.w,
          bottom: 24.h,
          child: FloatingActionButton(
            onPressed: () => _openAddItemBottomSheet(
              context,
              categories,
            ),
            backgroundColor: const Color(0xFF33261D),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 28.r,
            ),
          ),
        ),
      ],
    );
  }
}
