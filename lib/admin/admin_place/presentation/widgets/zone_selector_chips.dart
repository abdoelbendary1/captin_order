import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../domain/entities/admin_zone_entity.dart';

class ZoneSelectorChips extends StatelessWidget {
  final List<AdminZoneEntity> zones;
  final ValueChanged<String> onSelectZone;
  final VoidCallback onAddZone;

  const ZoneSelectorChips({
    super.key,
    required this.zones,
    required this.onSelectZone,
    required this.onAddZone,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.zonesUpper,
          style: textTheme.labelSmall?.copyWith(
            fontFamily: 'JetBrains Mono',
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            fontSize: 10.5.sp,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 44.h,
          child: Row(
            children: [
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: zones.length,
                  separatorBuilder: (_, __) => SizedBox(width: 10.w),
                  itemBuilder: (context, index) {
                    final zone = zones[index];
                    final isSelected = zone.isSelected;

                    return GestureDetector(
                      onTap: () => onSelectZone(zone.id),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? theme.primaryColor
                              : colorScheme.surfaceContainer,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Text(
                            zone.name,
                            style: textTheme.labelMedium?.copyWith(
                              fontFamily: 'JetBrains Mono',
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              color: isSelected
                                  ? colorScheme.onPrimary
                                  : colorScheme.onSurfaceVariant,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 10.w),

              // Plus (+) Dashed Circle Add Zone Button
              GestureDetector(
                onTap: onAddZone,
                child: Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: colorScheme.outlineVariant,
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    Icons.add_rounded,
                    color: colorScheme.onSurfaceVariant,
                    size: 20.r,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
