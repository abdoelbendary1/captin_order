import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    super.key,
    this.selectedIndex = 0,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 74.0,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // LTR Navigation Bar Items Row
              Positioned.fill(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Item 1 (Far Left - Active): Hall / Inside
                    _NavItem(
                      icon: Icons.grid_view_rounded,
                      label: AppStrings.navHall,
                      isSelected: selectedIndex == 0,
                      onTap: () => onItemTapped(0),
                    ),

                    // Item 2: Orders
                    _NavItem(
                      icon: Icons.receipt_long_outlined,
                      label: AppStrings.navOrders,
                      isSelected: selectedIndex == 1,
                      onTap: () => onItemTapped(1),
                    ),

                    // Spacer for fixed center FAB button
                    const SizedBox(width: 60.0),

                    // Item 4: Shift
                    _NavItem(
                      icon: Icons.access_time_rounded,
                      label: AppStrings.navShift,
                      isSelected: selectedIndex == 3,
                      onTap: () => onItemTapped(3),
                    ),

                    // Item 5 (Far Right): History
                    _NavItem(
                      icon: Icons.history_rounded,
                      label: AppStrings.navHistory,
                      isSelected: selectedIndex == 4,
                      onTap: () => onItemTapped(4),
                    ),
                  ],
                ),
              ),

              // Center Prominent "New Table" Action Button with Small White Frame
              Positioned(
                top: -14.0,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () => onItemTapped(2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 52.0,
                          height: 52.0,
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(14.0),
                            border: Border.all(
                              color: colorScheme.onPrimary,
                              width: 2.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: theme.shadowColor.withValues(alpha: 0.15),
                                blurRadius: 8.0,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.add_rounded,
                            color: colorScheme.onPrimary,
                            size: 28.0,
                          ),
                        ),
                        const SizedBox(height: 3.0),
                        Text(
                          AppStrings.navNewTable,
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 11.0,
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
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SizedBox(
      width: 64.0,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.secondaryContainer
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected
                    ? colorScheme.onSecondaryContainer
                    : colorScheme.onSurfaceVariant,
                size: 22.0,
              ),
              const SizedBox(height: 2.0),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: textTheme.labelSmall?.copyWith(
                  fontSize: 11.0,
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
