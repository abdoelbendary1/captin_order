import 'package:captin_order/core/error/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:captin_order/admin/domain/entities/admin_floor_plan_entity.dart';
import 'package:captin_order/admin/domain/repositories/admin_place_repository.dart';
import 'admin_place_event.dart';
import 'admin_place_state.dart';

@injectable
class AdminPlaceBloc extends Bloc<AdminPlaceEvent, AdminPlaceState> {
  final AdminPlaceRepository _repository;

  AdminPlaceBloc(this._repository) : super(const AdminPlaceState()) {
    on<LoadAdminFloorPlanEvent>(_onLoadFloorPlan);
    on<SelectAdminZoneEvent>(_onSelectZone);
    on<GenerateBulkTablesEvent>(_onGenerateBulkTables);
    on<AddZoneEvent>(_onAddZone);
  }

  Future<void> _onLoadFloorPlan(
    LoadAdminFloorPlanEvent event,
    Emitter<AdminPlaceState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _repository.getFloorPlan();

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        errorMessage: failure.displayMessage,
      )),
      (plan) => emit(state.copyWith(
        isLoading: false,
        floorPlan: plan,
      )),
    );
  }

  void _onSelectZone(
    SelectAdminZoneEvent event,
    Emitter<AdminPlaceState> emit,
  ) {
    final currentPlan = state.floorPlan;
    if (currentPlan == null) return;

    final updatedZones = currentPlan.zones.map((z) {
      return z.copyWith(isSelected: z.id == event.zoneId);
    }).toList();

    final updatedPlan = AdminFloorPlanEntity(
      zones: updatedZones,
      activeZoneId: event.zoneId,
      tableNumbers: currentPlan.tableNumbers,
    );

    emit(state.copyWith(floorPlan: updatedPlan));
  }

  Future<void> _onGenerateBulkTables(
    GenerateBulkTablesEvent event,
    Emitter<AdminPlaceState> emit,
  ) async {
    emit(state.copyWith(isGenerating: true, errorMessage: null));
    final result = await _repository.generateBulkTables(event.count);

    result.fold(
      (failure) => emit(state.copyWith(isGenerating: false, errorMessage: failure.displayMessage)),
      (plan) => emit(state.copyWith(
        isGenerating: false,
        floorPlan: plan,
        successMessage: '${event.count} tables generated successfully!',
      )),
    );
  }

  Future<void> _onAddZone(
    AddZoneEvent event,
    Emitter<AdminPlaceState> emit,
  ) async {
    final result = await _repository.addZone(event.zoneName);

    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.displayMessage)),
      (plan) => emit(state.copyWith(
        floorPlan: plan,
        successMessage: 'Zone "${event.zoneName}" added!',
      )),
    );
  }
}
