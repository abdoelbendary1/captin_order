import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/active_tables/presentation/pages/active_tables_page.dart';
import '../../shared/widgets/app_bottom_nav_scaffold.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<ActiveTablesBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ActiveTablesRoute>(path: '/active'),
      ],
    ),
    TypedStatefulShellBranch<TablesBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<TablesRoute>(path: '/tables'),
      ],
    ),
    TypedStatefulShellBranch<ShiftBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ShiftRoute>(path: '/shift'),
      ],
    ),
    TypedStatefulShellBranch<HistoryBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HistoryRoute>(path: '/history'),
      ],
    ),
  ],
)
class AppShellRouteData extends StatefulShellRouteData {
  const AppShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return AppBottomNavScaffold(navigationShell: navigationShell);
  }
}

class ActiveTablesBranchData extends StatefulShellBranchData { const ActiveTablesBranchData(); }
class TablesBranchData extends StatefulShellBranchData { const TablesBranchData(); }
class ShiftBranchData extends StatefulShellBranchData { const ShiftBranchData(); }
class HistoryBranchData extends StatefulShellBranchData { const HistoryBranchData(); }

class ActiveTablesRoute extends GoRouteData {
  const ActiveTablesRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const ActiveTablesPage();
}

class TablesRoute extends GoRouteData {
  const TablesRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Center(child: Text('All Tables'));
}

class ShiftRoute extends GoRouteData {
  const ShiftRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Center(child: Text('Shift Overview'));
}

class HistoryRoute extends GoRouteData {
  const HistoryRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Center(child: Text('Order History'));
}

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/active',
  routes: $appRoutes,
);