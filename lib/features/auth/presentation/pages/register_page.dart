import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/services/app_notification_service.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';
import '../widgets/register_card.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => getIt<AuthBloc>(),
      child: const RegisterView(),
    );
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
                state.successMessage ?? 'Staff profile created successfully!',
              );
              final role = state.user!.role.toLowerCase();
              if (role.contains('admin') || role.contains('manager')) {
                const AdminDashboardRoute().go(context);
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

                  // Register Main Card
                  RegisterCard(
                    isLoading: state.isLoading,
                    onRegister: ({
                      required fullName,
                      required role,
                      required email,
                      required pin,
                    }) {
                      context.read<AuthBloc>().add(
                            RegisterSubmittedEvent(
                              fullName: fullName,
                              role: role,
                              email: email,
                              pin: pin,
                            ),
                          );
                    },
                    onBackToLogin: () {
                      Navigator.pop(context);
                    },
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
