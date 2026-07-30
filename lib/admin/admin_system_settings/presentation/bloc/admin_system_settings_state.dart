import 'package:captin_order/admin/domain/entities/admin_system_settings_entity.dart';


class AdminSystemSettingsState {
  final bool isLoading;
  final bool isSaving;
  final bool isDiscoveringPrinter;
  final AdminSystemSettingsEntity? settings;
  final String? errorMessage;
  final String? successMessage;

  const AdminSystemSettingsState({
    this.isLoading = false,
    this.isSaving = false,
    this.isDiscoveringPrinter = false,
    this.settings,
    this.errorMessage,
    this.successMessage,
  });

  AdminSystemSettingsState copyWith({
    bool? isLoading,
    bool? isSaving,
    bool? isDiscoveringPrinter,
    AdminSystemSettingsEntity? settings,
    String? errorMessage,
    String? successMessage,
  }) {
    return AdminSystemSettingsState(
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      isDiscoveringPrinter: isDiscoveringPrinter ?? this.isDiscoveringPrinter,
      settings: settings ?? this.settings,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}
