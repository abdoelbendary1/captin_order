import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool isObscure;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Widget? trailingLabel;
  final bool isReadOnly;
  final VoidCallback? onTap;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.isObscure = false,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.trailingLabel,
    this.isReadOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: textTheme.labelSmall?.copyWith(
                fontFamily: 'JetBrains Mono',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                fontSize: 10.5.sp,
              ),
            ),
            if (trailingLabel != null) trailingLabel!,
          ],
        ),
        SizedBox(height: 6.h),

        // Text Field Box
        GestureDetector(
          onTap: onTap,
          child: TextFormField(
            controller: controller,
            obscureText: isObscure,
            onChanged: onChanged,
            validator: validator,
            keyboardType: keyboardType,
            readOnly: isReadOnly,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
              fontSize: 14.sp,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                fontSize: 13.5.sp,
              ),
              prefixIcon: Icon(
                prefixIcon,
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                size: 20.r,
              ),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(
                        suffixIcon,
                        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                        size: 20.r,
                      ),
                      onPressed: onSuffixTap,
                    )
                  : null,
              filled: true,
              fillColor: const Color(0xFFF7F4F2), // Light neutral warm grey
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.4),
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
      ],
    );
  }
}
