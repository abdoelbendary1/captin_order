// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $appShellRouteData,
  $adminShellRouteData,
  $adminMenuRoute,
  $adminDashboardRoute,
  $openTableRoute,
  $orderItemsRoute,
  $tableDetailsRoute,
  $checkoutRoute,
  $settingsRoute,
  $takeAwayHistoryRoute,
  $loginRoute,
  $registerRoute,
];

RouteBase get $appShellRouteData => StatefulShellRouteData.$route(
  factory: $AppShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/active',
          hasOverriddenOnExit: false,
          factory: $ActiveTablesRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/shift',
          hasOverriddenOnExit: false,
          factory: $ShiftRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      const AppShellRouteData();
}

mixin $ActiveTablesRoute on GoRouteData {
  static ActiveTablesRoute _fromState(GoRouterState state) =>
      const ActiveTablesRoute();

  @override
  String get location => GoRouteData.$location('/active');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ShiftRoute on GoRouteData {
  static ShiftRoute _fromState(GoRouterState state) => const ShiftRoute();

  @override
  String get location => GoRouteData.$location('/shift');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $adminShellRouteData => StatefulShellRouteData.$route(
  factory: $AdminShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/admin/dash',
          hasOverriddenOnExit: false,
          factory: $AdminDashRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/admin/staff',
          hasOverriddenOnExit: false,
          factory: $AdminStaffRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/admin/history',
          hasOverriddenOnExit: false,
          factory: $AdminHistoryRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/admin/setup',
          hasOverriddenOnExit: false,
          factory: $AdminSetupRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $AdminShellRouteDataExtension on AdminShellRouteData {
  static AdminShellRouteData _fromState(GoRouterState state) =>
      const AdminShellRouteData();
}

mixin $AdminDashRoute on GoRouteData {
  static AdminDashRoute _fromState(GoRouterState state) =>
      const AdminDashRoute();

  @override
  String get location => GoRouteData.$location('/admin/dash');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AdminStaffRoute on GoRouteData {
  static AdminStaffRoute _fromState(GoRouterState state) =>
      const AdminStaffRoute();

  @override
  String get location => GoRouteData.$location('/admin/staff');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AdminHistoryRoute on GoRouteData {
  static AdminHistoryRoute _fromState(GoRouterState state) =>
      const AdminHistoryRoute();

  @override
  String get location => GoRouteData.$location('/admin/history');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AdminSetupRoute on GoRouteData {
  static AdminSetupRoute _fromState(GoRouterState state) =>
      const AdminSetupRoute();

  @override
  String get location => GoRouteData.$location('/admin/setup');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $adminMenuRoute => GoRouteData.$route(
  path: '/admin/menu',
  hasOverriddenOnExit: false,
  factory: $AdminMenuRoute._fromState,
);

mixin $AdminMenuRoute on GoRouteData {
  static AdminMenuRoute _fromState(GoRouterState state) =>
      const AdminMenuRoute();

  @override
  String get location => GoRouteData.$location('/admin/menu');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $adminDashboardRoute => GoRouteData.$route(
  path: '/admin_dashboard',
  hasOverriddenOnExit: false,
  factory: $AdminDashboardRoute._fromState,
);

mixin $AdminDashboardRoute on GoRouteData {
  static AdminDashboardRoute _fromState(GoRouterState state) =>
      const AdminDashboardRoute();

  @override
  String get location => GoRouteData.$location('/admin_dashboard');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $openTableRoute => GoRouteData.$route(
  path: '/open_table',
  hasOverriddenOnExit: false,
  factory: $OpenTableRoute._fromState,
);

mixin $OpenTableRoute on GoRouteData {
  static OpenTableRoute _fromState(GoRouterState state) =>
      const OpenTableRoute();

  @override
  String get location => GoRouteData.$location('/open_table');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $orderItemsRoute => GoRouteData.$route(
  path: '/order_items',
  hasOverriddenOnExit: false,
  factory: $OrderItemsRoute._fromState,
);

mixin $OrderItemsRoute on GoRouteData {
  static OrderItemsRoute _fromState(GoRouterState state) => OrderItemsRoute(
    tableNumber: state.uri.queryParameters['table-number']!,
    areaName: state.uri.queryParameters['area-name']!,
  );

  OrderItemsRoute get _self => this as OrderItemsRoute;

  @override
  String get location => GoRouteData.$location(
    '/order_items',
    queryParams: {
      'table-number': _self.tableNumber,
      'area-name': _self.areaName,
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $tableDetailsRoute => GoRouteData.$route(
  path: '/table_details/:tableId',
  hasOverriddenOnExit: false,
  factory: $TableDetailsRoute._fromState,
);

mixin $TableDetailsRoute on GoRouteData {
  static TableDetailsRoute _fromState(GoRouterState state) =>
      TableDetailsRoute(tableId: state.pathParameters['tableId']!);

  TableDetailsRoute get _self => this as TableDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/table_details/${Uri.encodeComponent(_self.tableId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $checkoutRoute => GoRouteData.$route(
  path: '/checkout/:tableId',
  hasOverriddenOnExit: false,
  factory: $CheckoutRoute._fromState,
);

mixin $CheckoutRoute on GoRouteData {
  static CheckoutRoute _fromState(GoRouterState state) =>
      CheckoutRoute(tableId: state.pathParameters['tableId']!);

  CheckoutRoute get _self => this as CheckoutRoute;

  @override
  String get location =>
      GoRouteData.$location('/checkout/${Uri.encodeComponent(_self.tableId)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingsRoute => GoRouteData.$route(
  path: '/settings',
  hasOverriddenOnExit: false,
  factory: $SettingsRoute._fromState,
);

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $takeAwayHistoryRoute => GoRouteData.$route(
  path: '/takeaway_history',
  hasOverriddenOnExit: false,
  factory: $TakeAwayHistoryRoute._fromState,
);

mixin $TakeAwayHistoryRoute on GoRouteData {
  static TakeAwayHistoryRoute _fromState(GoRouterState state) =>
      const TakeAwayHistoryRoute();

  @override
  String get location => GoRouteData.$location('/takeaway_history');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',
  hasOverriddenOnExit: false,
  factory: $LoginRoute._fromState,
);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerRoute => GoRouteData.$route(
  path: '/register',
  hasOverriddenOnExit: false,
  factory: $RegisterRoute._fromState,
);

mixin $RegisterRoute on GoRouteData {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  @override
  String get location => GoRouteData.$location('/register');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
