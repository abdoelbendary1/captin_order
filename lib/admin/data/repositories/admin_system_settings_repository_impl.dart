import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/admin_system_settings_entity.dart';
import '../../domain/repositories/admin_system_settings_repository.dart';
import '../datasources/admin_system_settings_datasource.dart';

@LazySingleton(as: AdminSystemSettingsRepository)
class AdminSystemSettingsRepositoryImpl
    implements AdminSystemSettingsRepository {
  final AdminSystemSettingsDataSource _dataSource;

  AdminSystemSettingsRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, AdminSystemSettingsEntity>> getSettings() async {
    try {
      final settings = await _dataSource.getSettings();
      return right(settings);
    } catch (e) {
      return left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AdminSystemSettingsEntity>> saveSettings(
    AdminSystemSettingsEntity settings,
  ) async {
    try {
      final updated = await _dataSource.saveSettings(settings);
      return right(updated);
    } catch (e) {
      return left(Failure.serverError(e.toString()));
    }
  }
}
