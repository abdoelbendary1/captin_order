// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:captin_order/core/data/tables_store.dart' as _i652;
import 'package:captin_order/core/localization/locale_cubit.dart' as _i582;
import 'package:captin_order/features/active_tables/data/datasources/active_tables_local_datasource.dart'
    as _i369;
import 'package:captin_order/features/active_tables/data/repositories/active_tables_repository_impl.dart'
    as _i950;
import 'package:captin_order/features/active_tables/domain/repositories/active_tables_repository.dart'
    as _i32;
import 'package:captin_order/features/active_tables/presentation/bloc/active_tables_bloc.dart'
    as _i404;
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
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i582.LocaleCubit>(() => _i582.LocaleCubit());
    gh.lazySingleton<_i652.TablesStore>(() => _i652.TablesStore());
    gh.lazySingleton<_i32.OpenTableRemoteDataSource>(
      () => _i32.OpenTableRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i599.OrderItemsDataSource>(
      () => _i599.OrderItemsDataSourceImpl(gh<_i652.TablesStore>()),
    );
    gh.lazySingleton<_i600.TableDetailsDataSource>(
      () => _i600.TableDetailsDataSourceImpl(gh<_i652.TablesStore>()),
    );
    gh.lazySingleton<_i787.OpenTableLocalDataSource>(
      () => _i787.OpenTableLocalDataSourceImpl(gh<_i652.TablesStore>()),
    );
    gh.lazySingleton<_i543.CheckoutDataSource>(
      () => _i543.CheckoutDataSourceImpl(gh<_i652.TablesStore>()),
    );
    gh.lazySingleton<_i369.ActiveTablesLocalDataSource>(
      () => _i369.ActiveTablesLocalDataSourceImpl(gh<_i652.TablesStore>()),
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
    gh.lazySingleton<_i467.TableDetailsRepository>(
      () =>
          _i153.TableDetailsRepositoryImpl(gh<_i600.TableDetailsDataSource>()),
    );
    gh.lazySingleton<_i32.ActiveTablesRepository>(
      () => _i950.ActiveTablesRepositoryImpl(
        gh<_i369.ActiveTablesLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i1061.CheckoutRepository>(
      () => _i1051.CheckoutRepositoryImpl(gh<_i543.CheckoutDataSource>()),
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
    return this;
  }
}
