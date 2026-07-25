import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../active_tables/domain/entities/timeline_event.dart';

class OrderTimelineView extends StatelessWidget {
  final List<TimelineEvent> timeline;

  const OrderTimelineView({
    super.key,
    required this.timeline,
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
          AppStrings.orderTimeline,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12.0),
        if (timeline.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              'No timeline events recorded.',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: timeline.length,
            itemBuilder: (context, index) {
              final event = timeline[index];
              final isLast = index == timeline.length - 1;

              final timeStr =
                  '${event.timestamp.hour.toString().padLeft(2, '0')}:${event.timestamp.minute.toString().padLeft(2, '0')} PM';

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.only(top: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 0
                              ? theme.primaryColor
                              : colorScheme.outlineVariant,
                        ),
                      ),
                      if (!isLast)
                        Container(
                          width: 2.0,
                          height: 36.0,
                          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                        ),
                    ],
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  event.title,
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                              ),
                              // Spacer(),
                              Text(
                                timeStr,
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontSize: 11.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2.0),
                          Text(
                            event.actor,
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontSize: 10.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
      ],
    );
  }
}
