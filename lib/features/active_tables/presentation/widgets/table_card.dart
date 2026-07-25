import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/router/app_router.dart';
import '../../domain/entities/table_entity.dart';

class TableCard extends StatelessWidget {
  final TableEntity table;

  const TableCard({
    super.key,
    required this.table,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final openedAt = table.openedAt ?? table.seatedAt ?? DateTime.now();

    return GestureDetector(
      onTap: () {
        TableDetailsRoute(tableId: table.id).go(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16.0),
          border: Border(
            left: BorderSide(
              color: theme.primaryColor,
              width: 4.5,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withValues(alpha: 0.05),
              blurRadius: 8.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Row 1: Code/Number + Live Ticking Timer badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      table.tableCode.isNotEmpty
                          ? table.tableCode
                          : '${AppStrings.tablePrefix}${table.tableNumber}',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),

                // Real-time Live Ticking Timer Badge (Clicks every 1s)
                LiveSeatedTimerBadge(openedAt: openedAt),
              ],
            ),

            // Row 2: Total Amount
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.currentTotal,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 9.5,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  '${table.currentTotal.toStringAsFixed(2)} ${AppStrings.currency}',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LiveSeatedTimerBadge extends StatefulWidget {
  final DateTime openedAt;

  const LiveSeatedTimerBadge({
    super.key,
    required this.openedAt,
  });

  @override
  State<LiveSeatedTimerBadge> createState() => _LiveSeatedTimerBadgeState();
}

class _LiveSeatedTimerBadgeState extends State<LiveSeatedTimerBadge> {
  Timer? _timer;
  late Duration _elapsed;

  @override
  void initState() {
    super.initState();
    _calculateElapsed();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          _calculateElapsed();
        });
      }
    });
  }

  void _calculateElapsed() {
    _elapsed = DateTime.now().difference(widget.openedAt);
    if (_elapsed.isNegative) {
      _elapsed = Duration.zero;
    }
  }

  @override
  void didUpdateWidget(covariant LiveSeatedTimerBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.openedAt != widget.openedAt) {
      _calculateElapsed();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    final mStr = minutes.toString().padLeft(2, '0');
    final sStr = seconds.toString().padLeft(2, '0');

    if (hours > 0) {
      final hStr = hours.toString().padLeft(2, '0');
      return '$hStr:$mStr:$sStr';
    } else {
      return '$mStr:$sStr';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.access_time_rounded,
            size: 14.0,
            color: colorScheme.onSecondaryContainer,
          ),
          const SizedBox(width: 4.0),
          Text(
            _formatDuration(_elapsed),
            style: textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontFeatures: const [FontFeature.tabularFigures()],
              color: colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}