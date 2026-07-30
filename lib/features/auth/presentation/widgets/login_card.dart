import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import 'auth_button.dart';
import 'auth_text_field.dart';

class LoginCard extends StatefulWidget {
  final Function({
    required String staffIdOrEmail,
    required String pinOrPassword,
    required bool rememberStation,
  }) onLogin;
  final VoidCallback onGoToRegister;
  final bool isLoading;

  const LoginCard({
    super.key,
    required this.onLogin,
    required this.onGoToRegister,
    this.isLoading = false,
  });

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController(text: 'CAPTAIN-88');
  final _pinController = TextEditingController(text: '1234');
  bool _rememberStation = true;
  bool _isObscure = true;

  @override
  void dispose() {
    _idController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onLogin(
        staffIdOrEmail: _idController.text.trim(),
        pinOrPassword: _pinController.text.trim(),
        rememberStation: _rememberStation,
      );
    }
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
            // Top Circular Badge Icon
            Container(
              width: 56.r,
              height: 56.r,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.precision_manufacturing_rounded,
                color: colorScheme.onPrimary,
                size: 28.r,
              ),
            ),
            SizedBox(height: 14.h),

            // ESPRESSO LOGIC label
            Text(
              AppStrings.espressoLogic,
              style: textTheme.labelSmall?.copyWith(
                fontFamily: 'JetBrains Mono',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: const Color(0xFF7D562D), // Gold/bronze accent
                fontSize: 10.5.sp,
              ),
            ),
            SizedBox(height: 4.h),

            // Welcome Back Title
            Text(
              AppStrings.welcomeBack,
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: colorScheme.onSurface,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 6.h),

            // Subtitle
            Text(
              AppStrings.accessTerminalSubtitle,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontSize: 13.sp,
              ),
            ),
            SizedBox(height: 24.h),

            // Field 1: Staff ID or Email
            AuthTextField(
              label: AppStrings.staffIdOrEmail,
              hintText: AppStrings.enterYourIdHint,
              prefixIcon: Icons.badge_outlined,
              controller: _idController,
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
            ),
            SizedBox(height: 16.h),

            // Field 2: PIN or Password
            AuthTextField(
              label: AppStrings.pinOrPassword,
              hintText: '••••••••',
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
              keyboardType: TextInputType.visiblePassword,
              trailingLabel: GestureDetector(
                onTap: () {},
                child: Text(
                  AppStrings.forgotPassword,
                  style: textTheme.labelSmall?.copyWith(
                    fontFamily: 'JetBrains Mono',
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF7D562D),
                    fontSize: 10.5.sp,
                  ),
                ),
              ),
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
            ),
            SizedBox(height: 12.h),

            // Remember station Checkbox
            Row(
              children: [
                SizedBox(
                  width: 20.r,
                  height: 20.r,
                  child: Checkbox(
                    value: _rememberStation,
                    onChanged: (val) {
                      setState(() {
                        _rememberStation = val ?? true;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    activeColor: theme.primaryColor,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  AppStrings.rememberThisStation,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Sign In Button
            AuthButton(
              text: AppStrings.signIn,
              onPressed: _submit,
              isLoading: widget.isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
