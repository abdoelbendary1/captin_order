abstract class AdminDashboardEvent {
  const AdminDashboardEvent();
}

class LoadAdminDashboardMetricsEvent extends AdminDashboardEvent {
  const LoadAdminDashboardMetricsEvent();
}

class RefreshAdminDashboardMetricsEvent extends AdminDashboardEvent {
  const RefreshAdminDashboardMetricsEvent();
}
