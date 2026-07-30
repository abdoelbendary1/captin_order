import 'package:captin_order/admin/admin_dashboard/presentation/widgets/admin_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminShellScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AdminShellScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AdminBottomNavBar(
        selectedIndex: navigationShell.currentIndex,
        onItemSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
