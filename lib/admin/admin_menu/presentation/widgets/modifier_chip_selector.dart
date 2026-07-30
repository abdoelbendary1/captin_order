import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModifierChipSelector extends StatelessWidget {
  final List<String> availableModifiers;
  final List<String> selectedModifiers;
  final ValueChanged<List<String>> onChanged;

  const ModifierChipSelector({
    super.key,
    required this.availableModifiers,
    required this.selectedModifiers,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 10.h,
      children: availableModifiers.map((modifier) {
        final isSelected = selectedModifiers.contains(modifier);
        return InkWell(
          onTap: () {
            final updated = List<String>.from(selectedModifiers);
            if (isSelected) {
              updated.remove(modifier);
            } else {
              updated.add(modifier);
            }
            onChanged(updated);
          },
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF1E150F) : const Color(0xFFFAF7F2),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isSelected ? const Color(0xFF1E150F) : const Color(0xFFE5DECE),
                width: 1.w,
              ),
            ),
            child: Text(
              modifier,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF2C221E),
                fontSize: 13.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
