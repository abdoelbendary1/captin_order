import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';

class SegmentedToggleTab extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const SegmentedToggleTab({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 48.0,
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final tabWidth = (constraints.maxWidth - 8.0) / 2;

            return Stack(
              children: [
                // Directional Sliding Pill matching RTL / LTR start alignment
                AnimatedPositionedDirectional(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOutCubic,
                  start: selectedIndex * tabWidth,
                  top: 0,
                  bottom: 0,
                  width: tabWidth,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: theme.shadowColor.withValues(alpha: 0.1),
                          blurRadius: 4.0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),

                // Interactive Tab Buttons (INSIDE / OUTSIDE)
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => onTabSelected(0),
                        child: Center(
                          child: Text(
                            AppStrings.tabInside.toUpperCase(),
                            style: textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: isRtl ? 0.0 : 1.1,
                              color: selectedIndex == 0
                                  ? colorScheme.onPrimary
                                  : colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => onTabSelected(1),
                        child: Center(
                          child: Text(
                            AppStrings.tabOutside.toUpperCase(),
                            style: textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: isRtl ? 0.0 : 1.1,
                              color: selectedIndex == 1
                                  ? colorScheme.onPrimary
                                  : colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
