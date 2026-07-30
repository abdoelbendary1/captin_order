import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/services/app_notification_service.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';
import '../widgets/login_card.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => getIt<AuthBloc>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              AppNotificationService.showError(context, state.errorMessage!);
            }
            if (state.user != null) {
              AppNotificationService.showSuccess(
                context,
                state.successMessage ?? 'Logged in successfully!',
              );
              final role = state.user!.role.toLowerCase();
              if (role.contains('admin') || role.contains('manager')) {
                const AdminDashRoute().go(context);
              } else {
                const ActiveTablesRoute().go(context);
              }
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Top Branding Header
                  const AuthHeader(),
                  SizedBox(height: 12.h),

                  // Login Main Card
                  LoginCard(
                    isLoading: state.isLoading,
                    onLogin: ({
                      required staffIdOrEmail,
                      required pinOrPassword,
                      required rememberStation,
                    }) {
                      context.read<AuthBloc>().add(
                            LoginSubmittedEvent(
                              staffIdOrEmail: staffIdOrEmail,
                              pinOrPassword: pinOrPassword,
                              rememberStation: rememberStation,
                            ),
                          );
                    },
                    onGoToRegister: () {
                      const RegisterRoute().push(context);
                    },
                  ),
                  SizedBox(height: 24.h),

                  // Bottom Link to Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${AppStrings.needAnAccount} ',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 13.5.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          const RegisterRoute().push(context);
                        },
                        child: Text(
                          AppStrings.registerNewStaff,
                          style: textTheme.titleSmall?.copyWith(
                            fontFamily: 'Hanken Grotesk',
                            fontWeight: FontWeight.w800,
                            color: colorScheme.onSurface,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Footer Icons & Tagline
                  const AuthFooter(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
