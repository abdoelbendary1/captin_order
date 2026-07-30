import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/theme_context_extension.dart';

class ShiftHistoryDownloadPdfButton extends StatelessWidget {
  final bool isExporting;
  final VoidCallback onPressed;

  const ShiftHistoryDownloadPdfButton({
    super.key,
    required this.isExporting,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton.icon(
        onPressed: isExporting ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 2,
        ),
        icon: isExporting
            ? SizedBox(
                width: 18.r,
                height: 18.r,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colorScheme.onPrimary,
                ),
              )
            : Icon(
                Icons.picture_as_pdf_rounded,
                size: 20.r,
                color: colorScheme.onPrimary,
              ),
        label: Text(
          isExporting ? 'Generating PDF...' : AppStrings.downloadPdfReport,
          style: textTheme.titleSmall?.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
