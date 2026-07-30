import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import 'auth_button.dart';
import 'auth_text_field.dart';

class RegisterCard extends StatefulWidget {
  final Function({
    required String fullName,
    required String role,
    required String email,
    required String pin,
  }) onRegister;
  final VoidCallback onBackToLogin;
  final bool isLoading;

  const RegisterCard({
    super.key,
    required this.onRegister,
    required this.onBackToLogin,
    this.isLoading = false,
  });

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Julian Vane');
  final _roleController = TextEditingController(text: 'Shop Captain');
  final _emailController = TextEditingController(text: 'julian@shopcaptain.com');
  final _pinController = TextEditingController(text: '4321');
  bool _isObscure = true;

  final List<String> _roles = [
    'Shop Captain',
    'Senior Barista',
    'Shift Lead',
    'Store Manager',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    _emailController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onRegister(
        fullName: _nameController.text.trim(),
        role: _roleController.text.trim(),
        email: _emailController.text.trim(),
        pin: _pinController.text.trim(),
      );
    }
  }

  void _showRolePicker() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        final textTheme = Theme.of(context).textTheme;
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _roles.map((role) {
              return ListTile(
                title: Text(
                  role,
                  style: textTheme.titleSmall,
                ),
                onTap: () {
                  setState(() {
                    _roleController.text = role;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.05),
            blurRadius: 20.r,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Join the Crew Title
            Text(
              AppStrings.joinTheCrew,
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: colorScheme.onSurface,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 6.h),

            // Subtitle
            Text(
              AppStrings.startJourneySubtitle,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontSize: 13.sp,
              ),
            ),
            SizedBox(height: 24.h),

            // Field 1: Full Name
            AuthTextField(
              label: AppStrings.fullName,
              hintText: AppStrings.egJulianVane,
              prefixIcon: Icons.person_outline_rounded,
              controller: _nameController,
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
            ),
            SizedBox(height: 16.h),

            // Field 2: Staff Role
            AuthTextField(
              label: AppStrings.staffRole,
              hintText: AppStrings.selectYourRole,
              prefixIcon: Icons.badge_outlined,
              suffixIcon: Icons.unfold_more_rounded,
              controller: _roleController,
              isReadOnly: true,
              onTap: _showRolePicker,
            ),
            SizedBox(height: 16.h),

            // Field 3: Email
            AuthTextField(
              label: AppStrings.email,
              hintText: AppStrings.emailHint,
              prefixIcon: Icons.mail_outline_rounded,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
            ),
            SizedBox(height: 16.h),

            // Field 4: Create Secure Pin
            AuthTextField(
              label: AppStrings.createSecurePin,
              hintText: AppStrings.pinCodeHint,
              prefixIcon: Icons.lock_outline_rounded,
              suffixIcon: _isObscure
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              onSuffixTap: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              isObscure: _isObscure,
              controller: _pinController,
              keyboardType: TextInputType.number,
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
            ),
            SizedBox(height: 6.h),

            // Info Note line
            Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  size: 13.r,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    AppStrings.pinInfoNote,
                    style: textTheme.labelSmall?.copyWith(
                      fontFamily: 'JetBrains Mono',
                      color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Register Button
            AuthButton(
              text: AppStrings.register,
              onPressed: _submit,
              isLoading: widget.isLoading,
            ),
            SizedBox(height: 20.h),

            // Footer Back to Login Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${AppStrings.alreadyPartOfCrew} ',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 12.5.sp,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onBackToLogin,
                  child: Text(
                    AppStrings.backToLogin,
                    style: textTheme.labelMedium?.copyWith(
                      fontFamily: 'JetBrains Mono',
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF7D562D),
                      fontSize: 12.5.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
