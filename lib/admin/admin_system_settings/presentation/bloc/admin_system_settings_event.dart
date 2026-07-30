import 'package:captin_order/admin/domain/entities/admin_system_settings_entity.dart';


abstract class AdminSystemSettingsEvent {
  const AdminSystemSettingsEvent();
}

class LoadAdminSystemSettingsEvent extends AdminSystemSettingsEvent {
  const LoadAdminSystemSettingsEvent();
}

class SaveAdminSystemSettingsEvent extends AdminSystemSettingsEvent {
  final AdminSystemSettingsEntity settings;
  const SaveAdminSystemSettingsEvent(this.settings);
}

class DiscoverPrinterEvent extends AdminSystemSettingsEvent {
  const DiscoverPrinterEvent();
}

class TestPrintEvent extends AdminSystemSettingsEvent {
  const TestPrintEvent();
}
