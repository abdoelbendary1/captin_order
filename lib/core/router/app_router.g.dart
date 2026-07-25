// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $appShellRouteData,
  $openTableRoute,
  $orderItemsRoute,
  $tableDetailsRoute,
  $checkoutRoute,
  $settingsRoute,
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
          path: '/tables',
          hasOverriddenOnExit: false,
          factory: $TablesRoute._fromState,
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
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/history',
          hasOverriddenOnExit: false,
          factory: $HistoryRoute._fromState,
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

mixin $TablesRoute on GoRouteData {
  static TablesRoute _fromState(GoRouterState state) => const TablesRoute();

  @override
  String get location => GoRouteData.$location('/tables');

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

mixin $HistoryRoute on GoRouteData {
  static HistoryRoute _fromState(GoRouterState state) => const HistoryRoute();

  @override
  String get location => GoRouteData.$location('/history');

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
