import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_strings.dart';
import '../../core/router/app_router.dart';

class AppBottomNavScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppBottomNavScaffold({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        // Seamless background with no top separator border line
        decoration: BoxDecoration(
          color: colorScheme.surface,
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 74.h,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // LTR Nav Bar Row of Fixed Items
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Item 1 (Leftmost - Branch 0): Hall / Inside
                      _NavTabItem(
                        icon: Icons.grid_view_rounded,
                        selectedIcon: Icons.grid_view_rounded,
                        label: AppStrings.navHall,
                        isSelected: navigationShell.currentIndex == 0,
                        onTap: () => _onTabSelected(0),
                      ),

                      // Item 2 (Branch 1): Orders
                      _NavTabItem(
                        icon: Icons.receipt_long_outlined,
                        selectedIcon: Icons.receipt_long_rounded,
                        label: AppStrings.navOrders,
                        isSelected: navigationShell.currentIndex == 1,
                        onTap: () => _onTabSelected(1),
                      ),

                      // Spacer for fixed center FAB button
                      SizedBox(width: 60.w),

                      // Item 4 (Branch 2): Shift
                      _NavTabItem(
                        icon: Icons.access_time_rounded,
                        selectedIcon: Icons.access_time_filled_rounded,
                        label: AppStrings.navShift,
                        isSelected: navigationShell.currentIndex == 2,
                        onTap: () => _onTabSelected(2),
                      ),

                      // Item 5 (Rightmost - Branch 3): History
                      _NavTabItem(
                        icon: Icons.history_rounded,
                        selectedIcon: Icons.history_toggle_off_rounded,
                        label: AppStrings.navHistory,
                        isSelected: navigationShell.currentIndex == 3,
                        onTap: () => _onTabSelected(3),
                      ),
                    ],
                  ),
                ),

                // Center Prominent "New Table" Action Button with Small White Frame
                Positioned(
                  top: -14.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        final result =
                            await const OpenTableRoute().push<bool>(context);
                        if (result == true && context.mounted) {
                          // Action completed
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 52.r,
                            height: 52.r,
                            decoration: BoxDecoration(
                              color: theme.primaryColor,
                              borderRadius: BorderRadius.circular(14.r),
                              border: Border.all(
                                color: colorScheme.onPrimary, // Small white frame
                                width: 2.5.r,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.shadowColor.withValues(alpha: 0.15),
                                  blurRadius: 8.r,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.add_rounded,
                              color: colorScheme.onPrimary,
                              size: 28.r,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            AppStrings.navNewTable,
                            style: textTheme.labelSmall?.copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTabSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class _NavTabItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavTabItem({
    required this.icon,
    required this.label,
    required this.selectedIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SizedBox(
      width: 64.w,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.secondaryContainer
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelected ? selectedIcon : icon,
                color: isSelected
                    ? colorScheme.onSecondaryContainer
                    : colorScheme.onSurfaceVariant,
                size: 22.r,
              ),
              SizedBox(height: 2.h),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: textTheme.labelSmall?.copyWith(
                  fontSize: 11.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected
                      ? colorScheme.onSecondaryContainer
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}