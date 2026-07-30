import 'package:captin_order/admin/domain/entities/admin_floor_plan_entity.dart';


class AdminPlaceState {
  final bool isLoading;
  final bool isGenerating;
  final AdminFloorPlanEntity? floorPlan;
  final String? errorMessage;
  final String? successMessage;

  const AdminPlaceState({
    this.isLoading = false,
    this.isGenerating = false,
    this.floorPlan,
    this.errorMessage,
    this.successMessage,
  });

  AdminPlaceState copyWith({
    bool? isLoading,
    bool? isGenerating,
    AdminFloorPlanEntity? floorPlan,
    String? errorMessage,
    String? successMessage,
  }) {
    return AdminPlaceState(
      isLoading: isLoading ?? this.isLoading,
      isGenerating: isGenerating ?? this.isGenerating,
      floorPlan: floorPlan ?? this.floorPlan,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}
