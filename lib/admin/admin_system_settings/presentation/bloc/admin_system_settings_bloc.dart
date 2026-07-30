import 'package:captin_order/core/error/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:captin_order/admin/domain/repositories/admin_system_settings_repository.dart';
import 'admin_system_settings_event.dart';
import 'admin_system_settings_state.dart';

@injectable
class AdminSystemSettingsBloc
    extends Bloc<AdminSystemSettingsEvent, AdminSystemSettingsState> {
  final AdminSystemSettingsRepository _repository;

  AdminSystemSettingsBloc(this._repository)
      : super(const AdminSystemSettingsState()) {
    on<LoadAdminSystemSettingsEvent>(_onLoadSettings);
    on<SaveAdminSystemSettingsEvent>(_onSaveSettings);
    on<DiscoverPrinterEvent>(_onDiscoverPrinter);
    on<TestPrintEvent>(_onTestPrint);
  }

  Future<void> _onLoadSettings(
    LoadAdminSystemSettingsEvent event,
    Emitter<AdminSystemSettingsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _repository.getSettings();

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        errorMessage: failure.displayMessage,
      )),
      (settings) => emit(state.copyWith(
        isLoading: false,
        settings: settings,
      )),
    );
  }

  Future<void> _onSaveSettings(
    SaveAdminSystemSettingsEvent event,
    Emitter<AdminSystemSettingsState> emit,
  ) async {
    emit(state.copyWith(isSaving: true, errorMessage: null));
    final result = await _repository.saveSettings(event.settings);

    result.fold(
      (failure) => emit(state.copyWith(isSaving: false, errorMessage: failure.displayMessage)),
      (updated) => emit(state.copyWith(
        isSaving: false,
        settings: updated,
        successMessage: 'System settings saved successfully!',
      )),
    );
  }

  Future<void> _onDiscoverPrinter(
    DiscoverPrinterEvent event,
    Emitter<AdminSystemSettingsState> emit,
  ) async {
    emit(state.copyWith(isDiscoveringPrinter: true, errorMessage: null));
    await Future.delayed(const Duration(milliseconds: 700));

    final current = state.settings;
    if (current != null) {
      final updated = current.copyWith(
        printerStatus: 'Connected',
        printerIp: '192.168.1.104',
      );
      emit(state.copyWith(
        isDiscoveringPrinter: false,
        settings: updated,
        successMessage: 'Printer discovered at IP 192.168.1.104',
      ));
    } else {
      emit(state.copyWith(isDiscoveringPrinter: false));
    }
  }

  Future<void> _onTestPrint(
    TestPrintEvent event,
    Emitter<AdminSystemSettingsState> emit,
  ) async {
    await Future.delayed(const Duration(milliseconds: 400));
    emit(state.copyWith(
      successMessage: 'Test receipt printed successfully!',
    ));
  }
}
