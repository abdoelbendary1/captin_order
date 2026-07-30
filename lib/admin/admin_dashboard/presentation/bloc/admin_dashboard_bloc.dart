import 'package:captin_order/core/error/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/repositories/admin_dashboard_repository.dart';
import 'admin_dashboard_event.dart';
import 'admin_dashboard_state.dart';

@injectable
class AdminDashboardBloc
    extends Bloc<AdminDashboardEvent, AdminDashboardState> {
  final AdminDashboardRepository _repository;

  AdminDashboardBloc(this._repository) : super(const AdminDashboardState()) {
    on<LoadAdminDashboardMetricsEvent>(_onLoadMetrics);
    on<RefreshAdminDashboardMetricsEvent>(_onRefreshMetrics);
  }

  Future<void> _onLoadMetrics(
    LoadAdminDashboardMetricsEvent event,
    Emitter<AdminDashboardState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _repository.getAdminDashboardMetrics();

    result.fold(
      (failure) => emit(
        state.copyWith(isLoading: false, errorMessage: failure.displayMessage),
      ),
      (metrics) => emit(state.copyWith(isLoading: false, metrics: metrics)),
    );
  }

  Future<void> _onRefreshMetrics(
    RefreshAdminDashboardMetricsEvent event,
    Emitter<AdminDashboardState> emit,
  ) async {
    final result = await _repository.getAdminDashboardMetrics();
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.displayMessage)),
      (metrics) => emit(state.copyWith(metrics: metrics)),
    );
  }
}
