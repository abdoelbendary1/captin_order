import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'selectable_box.dart'; // Add this import

class GuestCountGrid extends StatelessWidget {
  const GuestCountGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final counts = ['1', '2', '3', '4', '5', '6', '7', '8+'];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1.2,
      ),
      itemCount: counts.length,
      itemBuilder: (context, index) {
        final isSelected = counts[index] == '4'; // Mock selected state
        return SelectableBox(
          // Removed the underscore
          label: counts[index],
          isSelected: isSelected,
          selectedColor: Theme.of(context).colorScheme.primary,
        );
      },
    );
  }
}
