import 'package:captin_order/core/error/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:captin_order/admin/domain/entities/admin_staff_entity.dart';
import 'package:captin_order/admin/domain/repositories/admin_team_repository.dart';
import 'admin_team_event.dart';
import 'admin_team_state.dart';

@injectable
class AdminTeamBloc extends Bloc<AdminTeamEvent, AdminTeamState> {
  final AdminTeamRepository _repository;

  AdminTeamBloc(this._repository) : super(const AdminTeamState()) {
    on<LoadAdminTeamDataEvent>(_onLoadTeamData);
    on<SwitchTeamTabEvent>(_onSwitchTeamTab);
    on<AddStaffMemberEvent>(_onAddStaffMember);
  }

  Future<void> _onLoadTeamData(
    LoadAdminTeamDataEvent event,
    Emitter<AdminTeamState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final staffResult = await _repository.getStaffMembers();
    final logsResult = await _repository.getAuditLogs();

    staffResult.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.displayMessage)),
      (staff) {
        logsResult.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.displayMessage)),
          (logs) => emit(state.copyWith(
            isLoading: false,
            staffList: staff,
            auditLogs: logs,
          )),
        );
      },
    );
  }

  void _onSwitchTeamTab(
    SwitchTeamTabEvent event,
    Emitter<AdminTeamState> emit,
  ) {
    emit(state.copyWith(selectedSubTabIndex: event.tabIndex));
  }

  Future<void> _onAddStaffMember(
    AddStaffMemberEvent event,
    Emitter<AdminTeamState> emit,
  ) async {
    final newMember = AdminStaffEntity(
      id: '',
      name: event.name,
      role: event.role,
      pin: event.pin,
      isActive: true,
    );

    final result = await _repository.addStaffMember(newMember);

    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.displayMessage)),
      (created) {
        final updatedStaff = List<AdminStaffEntity>.from(state.staffList)..add(created);
        emit(state.copyWith(
          staffList: updatedStaff,
          successMessage: '${created.name} added to staff team!',
        ));
      },
    );
  }
}
