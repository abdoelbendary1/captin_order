import 'package:flutter/material.dart';

class BarcodeWidget extends StatelessWidget {
  final double height;

  const BarcodeWidget({
    super.key,
    this.height = 36.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final barColor = colorScheme.onSurface.withValues(alpha: 0.65);

    // Barcode widths pattern
    final widths = [2, 1, 3, 1, 2, 4, 1, 2, 1, 3, 2, 1, 4, 1, 2, 3, 1, 2, 1, 3, 2, 1];

    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widths.map((w) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.2),
            width: w.toDouble() * 1.4,
            color: barColor,
          );
        }).toList(),
      ),
    );
  }
}
