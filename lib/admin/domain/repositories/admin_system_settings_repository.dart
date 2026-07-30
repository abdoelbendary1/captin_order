import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../entities/admin_system_settings_entity.dart';

abstract class AdminSystemSettingsRepository {
  Future<Either<Failure, AdminSystemSettingsEntity>> getSettings();
  Future<Either<Failure, AdminSystemSettingsEntity>> saveSettings(AdminSystemSettingsEntity settings);
}
