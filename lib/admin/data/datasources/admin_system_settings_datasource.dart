import 'package:injectable/injectable.dart';
import '../../domain/entities/admin_system_settings_entity.dart';

abstract class AdminSystemSettingsDataSource {
  Future<AdminSystemSettingsEntity> getSettings();
  Future<AdminSystemSettingsEntity> saveSettings(AdminSystemSettingsEntity settings);
}

@LazySingleton(as: AdminSystemSettingsDataSource)
class AdminSystemSettingsDataSourceImpl implements AdminSystemSettingsDataSource {
  AdminSystemSettingsEntity _settings = const AdminSystemSettingsEntity(
    cafeName: 'Artisanal Brew Co.',
    welcomeMessage: 'Thank you for supporting artisanal craftsmanship. Follow us @artisanalbrew',
    vatPercent: 15.0,
    serviceChargePercent: 5.0,
    printerType: 'Cashier (Receipts)',
    printerStatus: 'Connected',
    printerIp: '192.168.1.104',
  );

  @override
  Future<AdminSystemSettingsEntity> getSettings() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _settings;
  }

  @override
  Future<AdminSystemSettingsEntity> saveSettings(AdminSystemSettingsEntity settings) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _settings = settings;
    return _settings;
  }
}
