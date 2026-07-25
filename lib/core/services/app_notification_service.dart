import 'package:flutter/material.dart';

enum NotificationType { success, error, info, warning }

class AppNotificationService {
  static void showSuccess(BuildContext context, String message) {
    show(context, message: message, type: NotificationType.success);
  }

  static void showError(BuildContext context, String message) {
    show(context, message: message, type: NotificationType.error);
  }

  static void showInfo(BuildContext context, String message) {
    show(context, message: message, type: NotificationType.info);
  }

  static void showWarning(BuildContext context, String message) {
    show(context, message: message, type: NotificationType.warning);
  }

  static void show(
    BuildContext context, {
    required String message,
    required NotificationType type,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlayState = Overlay.maybeOf(context);
    if (overlayState == null) return;

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return _NotificationToast(
          message: message,
          type: type,
          duration: duration,
          onDismiss: () {
            if (overlayEntry.mounted) {
              overlayEntry.remove();
            }
          },
        );
      },
    );

    overlayState.insert(overlayEntry);
  }
}

class _NotificationToast extends StatefulWidget {
  final String message;
  final NotificationType type;
  final Duration duration;
  final VoidCallback onDismiss;

  const _NotificationToast({
    required this.message,
    required this.type,
    required this.duration,
    required this.onDismiss,
  });

  @override
  State<_NotificationToast> createState() => _NotificationToastState();
}

class _NotificationToastState extends State<_NotificationToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeIn,
    ));

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    Future.delayed(widget.duration, () {
      if (mounted) {
        _dismiss();
      }
    });
  }

  void _dismiss() {
    _controller.reverse().then((_) {
      widget.onDismiss();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  IconData _getIcon() {
    switch (widget.type) {
      case NotificationType.success:
        return Icons.check_circle_rounded;
      case NotificationType.error:
        return Icons.error_outline_rounded;
      case NotificationType.info:
        return Icons.info_outline_rounded;
      case NotificationType.warning:
        return Icons.warning_amber_rounded;
    }
  }

  Color _getBackgroundColor(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    switch (widget.type) {
      case NotificationType.success:
        return colorScheme.primaryContainer;
      case NotificationType.error:
        return colorScheme.errorContainer;
      case NotificationType.info:
        return colorScheme.secondaryContainer;
      case NotificationType.warning:
        return colorScheme.tertiaryContainer;
    }
  }

  Color _getForegroundColor(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    switch (widget.type) {
      case NotificationType.success:
        return colorScheme.onPrimaryContainer;
      case NotificationType.error:
        return colorScheme.onErrorContainer;
      case NotificationType.info:
        return colorScheme.onSecondaryContainer;
      case NotificationType.warning:
        return colorScheme.onTertiaryContainer;
    }
  }

  Color _getBorderColor(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    switch (widget.type) {
      case NotificationType.success:
        return theme.primaryColor;
      case NotificationType.error:
        return colorScheme.error;
      case NotificationType.info:
        return colorScheme.secondary;
      case NotificationType.warning:
        return colorScheme.tertiary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final bgColor = _getBackgroundColor(theme);
    final fgColor = _getForegroundColor(theme);
    final accentBorderColor = _getBorderColor(theme);

    return Positioned(
      top: MediaQuery.paddingOf(context).top + 12.0,
      left: 16.0,
      right: 16.0,
      child: SlideTransition(
        position: _offsetAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: _dismiss,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(14.0),
                  border: Border.all(
                    color: accentBorderColor.withValues(alpha: 0.4),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: theme.shadowColor.withValues(alpha: 0.15),
                      blurRadius: 10.0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      _getIcon(),
                      color: accentBorderColor,
                      size: 24.0,
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Text(
                        widget.message,
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: fgColor,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        color: fgColor.withValues(alpha: 0.7),
                        size: 18.0,
                      ),
                      onPressed: _dismiss,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
