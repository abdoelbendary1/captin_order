import 'package:captin_order/features/admin/admin_dashboard/presentation/pages/admin_dashboard_page.dart';
import 'package:captin_order/features/admin/admin_history/presentation/pages/admin_shift_history_page.dart';
import 'package:captin_order/features/admin/admin_system_settings/presentation/pages/admin_system_settings_page.dart';
import 'package:captin_order/features/admin/admin_team/presentation/pages/admin_team_page.dart';
import 'package:captin_order/features/auth/presentation/pages/login_page.dart';
import 'package:captin_order/features/auth/presentation/pages/register_page.dart';
import 'package:captin_order/features/checkout/presentation/pages/checkout_page.dart';
import 'package:captin_order/features/open_table/presentation/pages/open_table_page.dart';
import 'package:captin_order/features/order_items/presentation/pages/order_items_page.dart';
import 'package:captin_order/features/settings/presentation/pages/settings_page.dart';
import 'package:captin_order/features/shift/presentation/pages/shift_page.dart';
import 'package:captin_order/features/table_details/presentation/pages/table_details_page.dart';
import 'package:captin_order/features/take_away/presentation/pages/take_away_history_page.dart';
import 'package:captin_order/shared/widgets/admin_shell_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/admin/admin_menu/presentation/bloc/admin_menu_bloc.dart';
import '../../features/admin/admin_menu/presentation/bloc/admin_menu_event.dart';
import '../../features/admin/admin_menu/presentation/pages/admin_menu_management_page.dart';

import '../../features/active_tables/presentation/pages/active_tables_page.dart';
import '../../features/auth/data/datasources/auth_local_datasource.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../shared/widgets/app_bottom_nav_scaffold.dart';
import '../di/injection.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@TypedStatefulShellRoute<AppShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<ActiveTablesBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ActiveTablesRoute>(path: '/active'),
      ],
    ),
    TypedStatefulShellBranch<ShiftBranchData>(
      routes: <TypedRoute<RouteData>>[TypedGoRoute<ShiftRoute>(path: '/shift')],
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

class ActiveTablesBranchData extends StatefulShellBranchData {
  const ActiveTablesBranchData();
}

class ShiftBranchData extends StatefulShellBranchData {
  const ShiftBranchData();
}

class ActiveTablesRoute extends GoRouteData with $ActiveTablesRoute {
  const ActiveTablesRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ActiveTablesPage();
}

class ShiftRoute extends GoRouteData with $ShiftRoute {
  const ShiftRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const ShiftPage();
}

@TypedStatefulShellRoute<AdminShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<AdminDashBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AdminDashRoute>(path: '/admin/dash'),
      ],
    ),
    TypedStatefulShellBranch<AdminStaffBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AdminStaffRoute>(path: '/admin/staff'),
      ],
    ),
    TypedStatefulShellBranch<AdminHistoryBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AdminHistoryRoute>(path: '/admin/history'),
      ],
    ),
    TypedStatefulShellBranch<AdminSetupBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AdminSetupRoute>(path: '/admin/setup'),
      ],
    ),
  ],
)
class AdminShellRouteData extends StatefulShellRouteData {
  const AdminShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return AdminShellScaffold(navigationShell: navigationShell);
  }
}

class AdminDashBranchData extends StatefulShellBranchData {
  const AdminDashBranchData();
}

class AdminStaffBranchData extends StatefulShellBranchData {
  const AdminStaffBranchData();
}

class AdminHistoryBranchData extends StatefulShellBranchData {
  const AdminHistoryBranchData();
}

class AdminSetupBranchData extends StatefulShellBranchData {
  const AdminSetupBranchData();
}

class AdminDashRoute extends GoRouteData with $AdminDashRoute {
  const AdminDashRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminDashboardPage();
}

class AdminStaffRoute extends GoRouteData with $AdminStaffRoute {
  const AdminStaffRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminTeamPage();
}

class AdminHistoryRoute extends GoRouteData with $AdminHistoryRoute {
  const AdminHistoryRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminShiftHistoryPage();
}

class AdminSetupRoute extends GoRouteData with $AdminSetupRoute {
  const AdminSetupRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminSystemSettingsPage();
}

@TypedGoRoute<AdminMenuRoute>(path: '/admin/menu')
class AdminMenuRoute extends GoRouteData with $AdminMenuRoute {
  const AdminMenuRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider<AdminMenuBloc>(
      create: (context) => getIt<AdminMenuBloc>()
        ..add(const AdminMenuEvent.loadMenu()),
      child: const AdminMenuManagementPage(),
    );
  }
}

@TypedGoRoute<AdminDashboardRoute>(path: '/admin_dashboard')
class AdminDashboardRoute extends GoRouteData with $AdminDashboardRoute {
  const AdminDashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminDashboardPage();
}

@TypedGoRoute<OpenTableRoute>(path: '/open_table')
class OpenTableRoute extends GoRouteData with $OpenTableRoute {
  const OpenTableRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OpenTablePage();
}

@TypedGoRoute<OrderItemsRoute>(path: '/order_items')
class OrderItemsRoute extends GoRouteData with $OrderItemsRoute {
  final String tableNumber;
  final String areaName;

  const OrderItemsRoute({required this.tableNumber, required this.areaName});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      OrderItemsPage(tableNumber: tableNumber, areaName: areaName);
}

@TypedGoRoute<TableDetailsRoute>(path: '/table_details/:tableId')
class TableDetailsRoute extends GoRouteData with $TableDetailsRoute {
  final String tableId;

  const TableDetailsRoute({required this.tableId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      TableDetailsPage(tableId: tableId);
}

@TypedGoRoute<CheckoutRoute>(path: '/checkout/:tableId')
class CheckoutRoute extends GoRouteData with $CheckoutRoute {
  final String tableId;

  const CheckoutRoute({required this.tableId});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CheckoutPage(tableId: tableId);
}

@TypedGoRoute<SettingsRoute>(path: '/settings')
class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

@TypedGoRoute<TakeAwayHistoryRoute>(path: '/takeaway_history')
class TakeAwayHistoryRoute extends GoRouteData with $TakeAwayHistoryRoute {
  const TakeAwayHistoryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TakeAwayHistoryPage();
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginPage();
}

@TypedGoRoute<RegisterRoute>(path: '/register')
class RegisterRoute extends GoRouteData with $RegisterRoute {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RegisterPage();
}

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: $appRoutes,
  redirect: (BuildContext context, GoRouterState state) async {
    final authRepo = getIt<AuthRepository>();
    final isAutoLoginAvailable = await authRepo.checkAutoLoginAvailable();
    final isLoggingIn =
        state.matchedLocation == '/login' || state.matchedLocation == '/register';

    if (isAutoLoginAvailable) {
      final localDataSource = getIt<AuthLocalDataSource>();
      final user = await localDataSource.getUser();
      final role = user?.role.toLowerCase() ?? '';
      final isManager = role.contains('admin') || role.contains('manager');

      if (isLoggingIn || state.matchedLocation == '/admin_dashboard') {
        return isManager ? '/admin/dash' : '/active';
      }

      if (!isManager && state.matchedLocation.startsWith('/admin')) {
        return '/active';
      }
    } else {
      if (!isLoggingIn) {
        return '/login';
      }
    }
    return null;
  },
);
