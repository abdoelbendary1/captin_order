import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/router/app_router.dart';
import '../../domain/entities/table_entity.dart';

class ActiveTableCard extends StatefulWidget {
  final TableEntity table;

  const ActiveTableCard({
    super.key,
    required this.table,
  });

  @override
  State<ActiveTableCard> createState() => _ActiveTableCardState();
}

class _ActiveTableCardState extends State<ActiveTableCard> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatLiveTimer() {
    final openedAt = widget.table.openedAt ?? widget.table.seatedAt;
    if (openedAt == null) {
      return widget.table.timeSeated;
    }

    final duration = DateTime.now().difference(openedAt);
    if (duration.isNegative) return '00:00';

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');

    if (hours > 0) {
      final hoursStr = hours.toString().padLeft(2, '0');
      return '$hoursStr:$minutesStr:$secondsStr';
    }
    return '$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () {
        TableDetailsRoute(tableId: widget.table.id).push(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withValues(alpha: 0.1),
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Row: 3-dots icon on the left, Table Code (e.g. T-01) on the right
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.more_vert_rounded,
                  color: colorScheme.onPrimary.withValues(alpha: 0.7),
                  size: 16.0,
                ),
                Text(
                  widget.table.tableCode,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onPrimary.withValues(alpha: 0.7),
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            // Center: Large, bold table number (e.g. "01", "02") right-aligned
            Align(
              alignment: Alignment.centerRight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.table.tableNumber,
                  style: textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimary,
                    height: 1.0,
                  ),
                ),
              ),
            ),

            // Bottom Section: Right-aligned Live Refreshing Timer & Amount
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Live Refreshing Timer row (e.g. "15:20 m")
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatLiveTimer(),
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimary.withValues(alpha: 0.85),
                        fontSize: 10.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 3.0),
                    Text(
                      AppStrings.minutes,
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimary.withValues(alpha: 0.85),
                        fontSize: 10.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3.0),
                // Amount row (e.g. "45.00 EGP")
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.table.currentTotal.toStringAsFixed(2),
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimary,
                        fontSize: 11.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 3.0),
                    Text(
                      AppStrings.currency,
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onPrimary,
                        fontSize: 11.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
