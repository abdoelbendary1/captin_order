import '../../../domain/entities/admin_metrics_entity.dart';

class AdminDashboardState {
  final bool isLoading;
  final AdminMetricsEntity? metrics;
  final String? errorMessage;
  final int selectedNavIndex;

  const AdminDashboardState({
    this.isLoading = false,
    this.metrics,
    this.errorMessage,
    this.selectedNavIndex = 0,
  });

  AdminDashboardState copyWith({
    bool? isLoading,
    AdminMetricsEntity? metrics,
    String? errorMessage,
    int? selectedNavIndex,
  }) {
    return AdminDashboardState(
      isLoading: isLoading ?? this.isLoading,
      metrics: metrics ?? this.metrics,
      errorMessage: errorMessage,
      selectedNavIndex: selectedNavIndex ?? this.selectedNavIndex,
    );
  }
}
