import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveShiftCard extends StatefulWidget {
  final DateTime startTime;
  final bool isPaused;
  final VoidCallback onClockOut;
  final VoidCallback onTogglePause;

  const ActiveShiftCard({
    super.key,
    required this.startTime,
    this.isPaused = false,
    required this.onClockOut,
    required this.onTogglePause,
  });

  @override
  State<ActiveShiftCard> createState() => _ActiveShiftCardState();
}

class _ActiveShiftCardState extends State<ActiveShiftCard> {
  Timer? _timer;
  late Duration _elapsedDuration;

  @override
  void initState() {
    super.initState();
    _elapsedDuration = DateTime.now().difference(widget.startTime);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!widget.isPaused && mounted) {
        setState(() {
          _elapsedDuration = DateTime.now().difference(widget.startTime);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final hours = d.inHours.toString().padLeft(2, '0');
    final minutes = (d.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.04),
            blurRadius: 10.r,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ACTIVE SHIFT',
                      style: textTheme.labelSmall?.copyWith(
                        fontFamily: 'JetBrains Mono',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: const Color(0xFF7D562D), // Gold/Brown accent
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      _formatDuration(_elapsedDuration),
                      style: textTheme.displayMedium?.copyWith(
                        fontFamily: 'JetBrains Mono',
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onSurface,
                        fontSize: 28.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Started today at 07:00 AM',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              // Right Column Faded Clock Icon Graphic
              Container(
                width: 64.r,
                height: 64.r,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.access_time_filled_rounded,
                    size: 40.r,
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.25),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Action Buttons (Clock Out & Pause)
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: widget.onClockOut,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.exit_to_app_rounded,
                          color: colorScheme.onPrimary,
                          size: 18.r,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Clock Out',
                          style: textTheme.titleSmall?.copyWith(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              SizedBox(
                width: 48.w,
                height: 48.h,
                child: IconButton.filledTonal(
                  onPressed: widget.onTogglePause,
                  style: IconButton.styleFrom(
                    backgroundColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  icon: Icon(
                    widget.isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                    color: colorScheme.onSurface,
                    size: 22.r,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
