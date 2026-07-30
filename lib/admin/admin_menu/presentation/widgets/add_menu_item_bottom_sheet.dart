import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/admin_menu_category_entity.dart';
import '../../domain/entities/admin_menu_item_entity.dart';
import 'modifier_chip_selector.dart';

class AddMenuItemBottomSheet extends StatelessWidget {
  final List<AdminMenuCategoryEntity> categories;
  final ValueChanged<AdminMenuItemEntity> onSave;

  final TextEditingController nameController;
  final TextEditingController priceController;
  final ValueNotifier<String?> selectedCategoryNotifier;
  final ValueNotifier<List<String>> selectedModifiersNotifier;

  AddMenuItemBottomSheet({
    super.key,
    required this.categories,
    required this.onSave,
  })  : nameController = TextEditingController(),
        priceController = TextEditingController(),
        selectedCategoryNotifier = ValueNotifier<String?>(
          categories.isNotEmpty ? categories.first.id : null,
        ),
        selectedModifiersNotifier = ValueNotifier<List<String>>([]);

  void _submit(BuildContext context) {
    final name = nameController.text.trim();
    final price = double.tryParse(priceController.text.trim()) ?? 0.0;
    final catId = selectedCategoryNotifier.value ?? '';

    if (name.isNotEmpty && price > 0) {
      final item = AdminMenuItemEntity(
        id: '',
        categoryId: catId,
        name: name,
        price: price,
        isAvailable: true,
        modifiers: selectedModifiersNotifier.value,
      );
      onSave(item);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final defaultModifiers = [
      'Extra Shot',
      'Oat Milk  +\$ 0.50',
      'No Sugar',
      'Whipped Cream',
      'Caramel Drizzle',
    ];

    return Container(
      padding: EdgeInsets.fromLTRB(
        20.w,
        12.h,
        20.w,
        MediaQuery.of(context).viewInsets.bottom + 20.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFBFA),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 44.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFDDD7CD),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add New Item',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                    color: const Color(0xFF1E150F),
                  ),
                ),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    Icons.close_rounded,
                    size: 22.r,
                    color: const Color(0xFF7C6E65),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFF2ECE1),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'Item Name',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF7C6E65),
              ),
            ),
            SizedBox(height: 8.h),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'e.g. Pistachio Cortado',
                hintStyle: TextStyle(
                  color: const Color(0xFFC4B8A9),
                  fontSize: 15.sp,
                ),
                filled: true,
                fillColor: const Color(0xFFF7F3EC),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Base Price',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF7C6E65),
              ),
            ),
            SizedBox(height: 8.h),
            TextField(
              controller: priceController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: '\$ 0.00',
                hintStyle: TextStyle(
                  color: const Color(0xFFC4B8A9),
                  fontSize: 15.sp,
                ),
                filled: true,
                fillColor: const Color(0xFFF7F3EC),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MODIFIERS',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                    color: const Color(0xFF52453C),
                  ),
                ),
                Text(
                  '+ Create New',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF8B5E3C),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            ValueListenableBuilder<List<String>>(
              valueListenable: selectedModifiersNotifier,
              builder: (context, selectedMods, _) {
                return ModifierChipSelector(
                  availableModifiers: defaultModifiers,
                  selectedModifiers: selectedMods,
                  onChanged: (updated) {
                    selectedModifiersNotifier.value = updated;
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
            Text(
              'Category',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF7C6E65),
              ),
            ),
            SizedBox(height: 10.h),
            ValueListenableBuilder<String?>(
              valueListenable: selectedCategoryNotifier,
              builder: (context, selectedCatId, _) {
                return Wrap(
                  spacing: 8.w,
                  children: categories.map((cat) {
                    final isSelected = selectedCatId == cat.id;
                    return InkWell(
                      onTap: () {
                        selectedCategoryNotifier.value = cat.id;
                      },
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFFAF7F2)
                              : const Color(0xFFF2ECE1),
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF1E150F)
                                : const Color(0xFFE5DECE),
                            width: 1.w,
                          ),
                        ),
                        child: Text(
                          cat.name,
                          style: TextStyle(
                            color: const Color(0xFF2C221E),
                            fontSize: 13.sp,
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton.icon(
                onPressed: () => _submit(context),
                icon: Icon(
                  Icons.bookmark_outline_rounded,
                  size: 20.r,
                  color: Colors.white,
                ),
                label: Text(
                  'Save Item',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E150F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
