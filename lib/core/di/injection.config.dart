// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:captin_order/admin/admin_dashboard/presentation/bloc/admin_dashboard_bloc.dart'
    as _i13;
import 'package:captin_order/admin/admin_history/data/datasources/admin_shift_history_remote_datasource.dart'
    as _i908;
import 'package:captin_order/admin/admin_history/data/repositories/admin_shift_history_repository_impl.dart'
    as _i640;
import 'package:captin_order/admin/admin_history/domain/repositories/admin_shift_history_repository.dart'
    as _i486;
import 'package:captin_order/admin/admin_history/presentation/bloc/admin_shift_history_bloc.dart'
    as _i806;
import 'package:captin_order/admin/admin_menu/data/datasources/admin_menu_remote_datasource.dart'
    as _i407;
import 'package:captin_order/admin/admin_menu/data/repositories/admin_menu_repository_impl.dart'
    as _i20;
import 'package:captin_order/admin/admin_menu/domain/cqrs/create_admin_menu_item_command.dart'
    as _i345;
import 'package:captin_order/admin/admin_menu/domain/cqrs/get_admin_menu_categories_query.dart'
    as _i682;
import 'package:captin_order/admin/admin_menu/domain/cqrs/get_admin_menu_items_query.dart'
    as _i424;
import 'package:captin_order/admin/admin_menu/domain/repositories/admin_menu_repository.dart'
    as _i922;
import 'package:captin_order/admin/admin_menu/presentation/bloc/admin_menu_bloc.dart'
    as _i1064;
import 'package:captin_order/admin/admin_place/presentation/bloc/admin_place_bloc.dart'
    as _i542;
import 'package:captin_order/admin/admin_system_settings/presentation/bloc/admin_system_settings_bloc.dart'
    as _i699;
import 'package:captin_order/admin/admin_team/presentation/bloc/admin_team_bloc.dart'
    as _i1062;
import 'package:captin_order/admin/data/datasources/admin_dashboard_datasource.dart'
    as _i343;
import 'package:captin_order/admin/data/datasources/admin_place_datasource.dart'
    as _i775;
import 'package:captin_order/admin/data/datasources/admin_system_settings_datasource.dart'
    as _i661;
import 'package:captin_order/admin/data/datasources/admin_team_datasource.dart'
    as _i294;
import 'package:captin_order/admin/data/repositories/admin_dashboard_repository_impl.dart'
    as _i930;
import 'package:captin_order/admin/data/repositories/admin_place_repository_impl.dart'
    as _i398;
import 'package:captin_order/admin/data/repositories/admin_system_settings_repository_impl.dart'
    as _i529;
import 'package:captin_order/admin/data/repositories/admin_team_repository_impl.dart'
    as _i1004;
import 'package:captin_order/admin/domain/repositories/admin_dashboard_repository.dart'
    as _i732;
import 'package:captin_order/admin/domain/repositories/admin_place_repository.dart'
    as _i423;
import 'package:captin_order/admin/domain/repositories/admin_system_settings_repository.dart'
    as _i1070;
import 'package:captin_order/admin/domain/repositories/admin_team_repository.dart'
    as _i31;
import 'package:captin_order/core/data/tables_store.dart' as _i652;
import 'package:captin_order/core/di/register_module.dart' as _i438;
import 'package:captin_order/core/localization/locale_cubit.dart' as _i582;
import 'package:captin_order/core/theme/theme_cubit.dart' as _i813;
import 'package:captin_order/features/active_tables/data/datasources/active_tables_local_datasource.dart'
    as _i369;
import 'package:captin_order/features/active_tables/data/repositories/active_tables_repository_impl.dart'
    as _i950;
import 'package:captin_order/features/active_tables/domain/repositories/active_tables_repository.dart'
    as _i32;
import 'package:captin_order/features/active_tables/presentation/bloc/active_tables_bloc.dart'
    as _i404;
import 'package:captin_order/features/active_tables/presentation/bloc/ticker_cubit.dart'
    as _i856;
import 'package:captin_order/features/auth/data/datasources/auth_local_datasource.dart'
    as _i589;
import 'package:captin_order/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i1062;
import 'package:captin_order/features/auth/data/repositories/auth_repository_impl.dart'
    as _i923;
import 'package:captin_order/features/auth/domain/repositories/auth_repository.dart'
    as _i136;
import 'package:captin_order/features/auth/presentation/bloc/auth_bloc.dart'
    as _i619;
import 'package:captin_order/features/checkout/data/datasources/checkout_datasource.dart'
    as _i543;
import 'package:captin_order/features/checkout/data/repositories/checkout_repository_impl.dart'
    as _i1051;
import 'package:captin_order/features/checkout/domain/repositories/checkout_repository.dart'
    as _i1061;
import 'package:captin_order/features/checkout/presentation/bloc/checkout_bloc.dart'
    as _i439;
import 'package:captin_order/features/open_table/data/datasources/open_table_local_datasource.dart'
    as _i787;
import 'package:captin_order/features/open_table/data/datasources/open_table_remote_datasource.dart'
    as _i32;
import 'package:captin_order/features/open_table/data/repositories/open_table_repository_impl.dart'
    as _i947;
import 'package:captin_order/features/open_table/domain/repositories/open_table_repository.dart'
    as _i673;
import 'package:captin_order/features/open_table/presentation/bloc/open_table_bloc.dart'
    as _i986;
import 'package:captin_order/features/order_items/data/datasources/order_items_datasource.dart'
    as _i599;
import 'package:captin_order/features/order_items/data/repositories/order_items_repository_impl.dart'
    as _i372;
import 'package:captin_order/features/order_items/domain/repositories/order_items_repository.dart'
    as _i27;
import 'package:captin_order/features/order_items/presentation/bloc/order_items_bloc.dart'
    as _i734;
import 'package:captin_order/features/table_details/data/datasources/table_details_datasource.dart'
    as _i600;
import 'package:captin_order/features/table_details/data/repositories/table_details_repository_impl.dart'
    as _i153;
import 'package:captin_order/features/table_details/domain/repositories/table_details_repository.dart'
    as _i467;
import 'package:captin_order/features/table_details/presentation/bloc/table_details_bloc.dart'
    as _i9;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i856.TickerCubit>(() => _i856.TickerCubit());
    gh.singleton<_i582.LocaleCubit>(() => _i582.LocaleCubit());
    gh.singleton<_i813.ThemeCubit>(() => _i813.ThemeCubit());
    gh.lazySingleton<_i652.TablesStore>(() => _i652.TablesStore());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.lazySingleton<_i32.OpenTableRemoteDataSource>(
      () => _i32.OpenTableRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i343.AdminDashboardDataSource>(
      () => _i343.AdminDashboardDataSourceImpl(),
    );
    gh.lazySingleton<_i294.AdminTeamDataSource>(
      () => _i294.AdminTeamDataSourceImpl(),
    );
    gh.lazySingleton<_i589.AuthLocalDataSource>(
      () => _i589.AuthLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i775.AdminPlaceDataSource>(
      () => _i775.AdminPlaceDataSourceImpl(),
    );
    gh.lazySingleton<_i908.AdminShiftHistoryRemoteDataSource>(
      () => _i908.AdminShiftHistoryRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i1062.AuthRemoteDataSource>(
      () => _i1062.AuthRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i732.AdminDashboardRepository>(
      () => _i930.AdminDashboardRepositoryImpl(
        gh<_i343.AdminDashboardDataSource>(),
      ),
    );
    gh.lazySingleton<_i661.AdminSystemSettingsDataSource>(
      () => _i661.AdminSystemSettingsDataSourceImpl(),
    );
    gh.lazySingleton<_i599.OrderItemsDataSource>(
      () => _i599.OrderItemsDataSourceImpl(gh<_i652.TablesStore>()),
    );
    gh.lazySingleton<_i600.TableDetailsDataSource>(
      () => _i600.TableDetailsDataSourceImpl(gh<_i652.TablesStore>()),
    );
    gh.lazySingleton<_i31.AdminTeamRepository>(
      () => _i1004.AdminTeamRepositoryImpl(gh<_i294.AdminTeamDataSource>()),
    );
    gh.lazySingleton<_i136.AuthRepository>(
      () => _i923.AuthRepositoryImpl(
        gh<_i1062.AuthRemoteDataSource>(),
        gh<_i589.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i1062.AdminTeamBloc>(
      () => _i1062.AdminTeamBloc(gh<_i31.AdminTeamRepository>()),
    );
    gh.lazySingleton<_i787.OpenTableLocalDataSource>(
      () => _i787.OpenTableLocalDataSourceImpl(gh<_i652.TablesStore>()),
    );
    gh.lazySingleton<_i407.AdminMenuRemoteDataSource>(
      () => _i407.AdminMenuRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i486.AdminShiftHistoryRepository>(
      () => _i640.AdminShiftHistoryRepositoryImpl(
        gh<_i908.AdminShiftHistoryRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i543.CheckoutDataSource>(
      () => _i543.CheckoutDataSourceImpl(gh<_i652.TablesStore>()),
    );
    gh.lazySingleton<_i369.ActiveTablesLocalDataSource>(
      () => _i369.ActiveTablesLocalDataSourceImpl(gh<_i652.TablesStore>()),
    );
    gh.lazySingleton<_i423.AdminPlaceRepository>(
      () => _i398.AdminPlaceRepositoryImpl(gh<_i775.AdminPlaceDataSource>()),
    );
    gh.factory<_i13.AdminDashboardBloc>(
      () => _i13.AdminDashboardBloc(gh<_i732.AdminDashboardRepository>()),
    );
    gh.lazySingleton<_i1070.AdminSystemSettingsRepository>(
      () => _i529.AdminSystemSettingsRepositoryImpl(
        gh<_i661.AdminSystemSettingsDataSource>(),
      ),
    );
    gh.lazySingleton<_i673.OpenTableRepository>(
      () => _i947.OpenTableRepositoryImpl(gh<_i787.OpenTableLocalDataSource>()),
    );
    gh.lazySingleton<_i27.OrderItemsRepository>(
      () => _i372.OrderItemsRepositoryImpl(gh<_i599.OrderItemsDataSource>()),
    );
    gh.factory<_i986.OpenTableBloc>(
      () => _i986.OpenTableBloc(gh<_i673.OpenTableRepository>()),
    );
    gh.factory<_i806.AdminShiftHistoryBloc>(
      () =>
          _i806.AdminShiftHistoryBloc(gh<_i486.AdminShiftHistoryRepository>()),
    );
    gh.lazySingleton<_i467.TableDetailsRepository>(
      () =>
          _i153.TableDetailsRepositoryImpl(gh<_i600.TableDetailsDataSource>()),
    );
    gh.factory<_i542.AdminPlaceBloc>(
      () => _i542.AdminPlaceBloc(gh<_i423.AdminPlaceRepository>()),
    );
    gh.lazySingleton<_i32.ActiveTablesRepository>(
      () => _i950.ActiveTablesRepositoryImpl(
        gh<_i369.ActiveTablesLocalDataSource>(),
      ),
    );
    gh.factory<_i619.AuthBloc>(
      () => _i619.AuthBloc(gh<_i136.AuthRepository>()),
    );
    gh.lazySingleton<_i1061.CheckoutRepository>(
      () => _i1051.CheckoutRepositoryImpl(gh<_i543.CheckoutDataSource>()),
    );
    gh.lazySingleton<_i922.AdminMenuRepository>(
      () => _i20.AdminMenuRepositoryImpl(gh<_i407.AdminMenuRemoteDataSource>()),
    );
    gh.factory<_i699.AdminSystemSettingsBloc>(
      () => _i699.AdminSystemSettingsBloc(
        gh<_i1070.AdminSystemSettingsRepository>(),
      ),
    );
    gh.factory<_i9.TableDetailsBloc>(
      () => _i9.TableDetailsBloc(gh<_i467.TableDetailsRepository>()),
    );
    gh.factory<_i734.OrderItemsBloc>(
      () => _i734.OrderItemsBloc(gh<_i27.OrderItemsRepository>()),
    );
    gh.factory<_i404.ActiveTablesBloc>(
      () => _i404.ActiveTablesBloc(gh<_i32.ActiveTablesRepository>()),
    );
    gh.factory<_i439.CheckoutBloc>(
      () => _i439.CheckoutBloc(gh<_i1061.CheckoutRepository>()),
    );
    gh.factory<_i345.CreateAdminMenuItemCommand>(
      () => _i345.CreateAdminMenuItemCommand(gh<_i922.AdminMenuRepository>()),
    );
    gh.factory<_i682.GetAdminMenuCategoriesQuery>(
      () => _i682.GetAdminMenuCategoriesQuery(gh<_i922.AdminMenuRepository>()),
    );
    gh.factory<_i424.GetAdminMenuItemsQuery>(
      () => _i424.GetAdminMenuItemsQuery(gh<_i922.AdminMenuRepository>()),
    );
    gh.factory<_i1064.AdminMenuBloc>(
      () => _i1064.AdminMenuBloc(
        gh<_i682.GetAdminMenuCategoriesQuery>(),
        gh<_i424.GetAdminMenuItemsQuery>(),
        gh<_i345.CreateAdminMenuItemCommand>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i438.RegisterModule {}
