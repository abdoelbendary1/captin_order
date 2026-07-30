import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';

class BulkCreateTablesCard extends StatefulWidget {
  final ValueChanged<int> onGenerate;
  final bool isGenerating;

  const BulkCreateTablesCard({
    super.key,
    required this.onGenerate,
    this.isGenerating = false,
  });

  @override
  State<BulkCreateTablesCard> createState() => _BulkCreateTablesCardState();
}

class _BulkCreateTablesCardState extends State<BulkCreateTablesCard> {
  final _countController = TextEditingController(text: '12');

  @override
  void dispose() {
    _countController.dispose();
    super.dispose();
  }

  void _submit() {
    final count = int.tryParse(_countController.text.trim()) ?? 12;
    widget.onGenerate(count);
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.bulkCreateTables,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 12.h),

          // Count Label
          Text(
            AppStrings.countLabel,
            style: textTheme.labelSmall?.copyWith(
              fontFamily: 'JetBrains Mono',
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
              fontSize: 10.5.sp,
            ),
          ),
          SizedBox(height: 6.h),

          // Row with Input & Generate Button
          Row(
            children: [
              SizedBox(
                width: 90.w,
                child: TextField(
                  controller: _countController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    fontFamily: 'JetBrains Mono',
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                  decoration: InputDecoration(
                    hintText: '0',
                    filled: true,
                    fillColor: colorScheme.surfaceContainerLow,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: theme.primaryColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: SizedBox(
                  height: 46.h,
                  child: ElevatedButton(
                    onPressed: widget.isGenerating ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: widget.isGenerating
                        ? SizedBox(
                            width: 20.r,
                            height: 20.r,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colorScheme.onPrimary,
                            ),
                          )
                        : Text(
                            AppStrings.generate,
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onPrimary,
                              fontSize: 15.sp,
                            ),
                          ),
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
