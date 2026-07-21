// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:captin_order/features/active_tables/data/datasources/active_tables_local_datasource.dart'
    as _i369;
import 'package:captin_order/features/active_tables/data/repositories/active_tables_repository_impl.dart'
    as _i950;
import 'package:captin_order/features/active_tables/domain/repositories/active_tables_repository.dart'
    as _i32;
import 'package:captin_order/features/active_tables/presentation/bloc/active_tables_bloc.dart'
    as _i404;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i369.ActiveTablesLocalDataSource>(
      () => _i369.ActiveTablesLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i32.ActiveTablesRepository>(
      () => _i950.ActiveTablesRepositoryImpl(
        gh<_i369.ActiveTablesLocalDataSource>(),
      ),
    );
    gh.factory<_i404.ActiveTablesBloc>(
      () => _i404.ActiveTablesBloc(gh<_i32.ActiveTablesRepository>()),
    );
    return this;
  }
}
