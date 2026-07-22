import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'selectable_box.dart'; // Add this import

class TableNumberGrid extends StatelessWidget {
  const TableNumberGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1.2,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        final tableNumber = (index + 1).toString().padLeft(2, '0');
        final isSelected = tableNumber == '06'; // Mock selected state

        return SelectableBox(
          // Removed the underscore
          label: tableNumber,
          isSelected: isSelected,
          selectedColor: Theme.of(context).colorScheme.primary,
        );
      },
    );
  }
}
