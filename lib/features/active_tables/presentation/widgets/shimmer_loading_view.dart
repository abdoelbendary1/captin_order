import 'package:flutter/material.dart';

class ShimmerLoadingView extends StatefulWidget {
  const ShimmerLoadingView({super.key});

  @override
  State<ShimmerLoadingView> createState() => _ShimmerLoadingViewState();
}

class _ShimmerLoadingViewState extends State<ShimmerLoadingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final baseColor = colorScheme.surfaceContainerHigh;
        final opacity = 0.4 + (_controller.value * 0.6);

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 96.0),
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 1.0, // 3-column rounded square skeleton
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: baseColor.withValues(alpha: opacity),
                borderRadius: BorderRadius.circular(12.0),
              ),
            );
          },
        );
      },
    );
  }
}
