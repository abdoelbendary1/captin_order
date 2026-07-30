import 'package:captin_order/admin/admin_place/presentation/pages/admin_place_setup_page.dart';
import 'package:captin_order/admin/domain/entities/admin_system_settings_entity.dart';
import 'package:captin_order/core/router/app_router.dart';
import 'package:captin_order/core/theme/theme_cubit.dart';
import 'package:captin_order/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:captin_order/features/auth/domain/entities/user_entity.dart';
import 'package:captin_order/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:captin_order/admin/admin_menu/presentation/pages/admin_menu_management_page.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/localization/locale_cubit.dart';
import '../../../../core/services/app_notification_service.dart';
import '../bloc/admin_system_settings_bloc.dart';
import '../bloc/admin_system_settings_event.dart';
import '../bloc/admin_system_settings_state.dart';
import '../widgets/invoice_details_card.dart';
import '../widgets/network_printer_setup_card.dart';
import '../widgets/tax_service_card.dart';

class AdminSystemSettingsPage extends StatelessWidget {
  const AdminSystemSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminSystemSettingsBloc>(
      create: (context) =>
          getIt<AdminSystemSettingsBloc>()
            ..add(const LoadAdminSystemSettingsEvent()),
      child: const AdminSystemSettingsView(),
    );
  }
}

class AdminSystemSettingsView extends StatefulWidget {
  const AdminSystemSettingsView({super.key});

  @override
  State<AdminSystemSettingsView> createState() =>
      _AdminSystemSettingsViewState();
}

class _AdminSystemSettingsViewState extends State<AdminSystemSettingsView> {
  late TextEditingController _cafeNameController;
  late TextEditingController _welcomeMsgController;
  late TextEditingController _vatController;
  late TextEditingController _serviceChargeController;

  String _printerType = 'Cashier (Receipts)';
  UserEntity? _currentUser;

  @override
  void initState() {
    super.initState();
    _cafeNameController = TextEditingController();
    _welcomeMsgController = TextEditingController();
    _vatController = TextEditingController();
    _serviceChargeController = TextEditingController();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final u = await getIt<AuthLocalDataSource>().getUser();
    if (mounted && u != null) {
      setState(() {
        _currentUser = u;
      });
    }
  }

  @override
  void dispose() {
    _cafeNameController.dispose();
    _welcomeMsgController.dispose();
    _vatController.dispose();
    _serviceChargeController.dispose();
    super.dispose();
  }

  void _populateFields(AdminSystemSettingsEntity settings) {
    _cafeNameController.text = settings.cafeName;
    _welcomeMsgController.text = settings.welcomeMessage;
    _vatController.text = settings.vatPercent.toStringAsFixed(1);
    _serviceChargeController.text = settings.serviceChargePercent
        .toStringAsFixed(1);
    _printerType = settings.printerType;
  }

  void _save(BuildContext context, AdminSystemSettingsEntity? current) {
    final vatVal = double.tryParse(_vatController.text.trim()) ?? 15.0;
    final serviceVal =
        double.tryParse(_serviceChargeController.text.trim()) ?? 5.0;

    final updated =
        (current ??
                const AdminSystemSettingsEntity(
                  cafeName: 'Artisanal Brew Co.',
                  welcomeMessage:
                      'Thank you for supporting artisanal craftsmanship.',
                  vatPercent: 15.0,
                  serviceChargePercent: 5.0,
                  printerType: 'Cashier (Receipts)',
                  printerStatus: 'Connected',
                  printerIp: '192.168.1.104',
                ))
            .copyWith(
              cafeName: _cafeNameController.text.trim(),
              welcomeMessage: _welcomeMsgController.text.trim(),
              vatPercent: vatVal,
              serviceChargePercent: serviceVal,
              printerType: _printerType,
            );

    context.read<AdminSystemSettingsBloc>().add(
      SaveAdminSystemSettingsEvent(updated),
    );
  }

  void _openPrinterSetupModal(BuildContext context) {
    final bloc = context.read<AdminSystemSettingsBloc>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return BlocProvider.value(
          value: bloc,
          child: StatefulBuilder(
            builder: (context, setStateModal) {
              final colorScheme = Theme.of(context).colorScheme;
              final textTheme = Theme.of(context).textTheme;

              return Container(
                padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 24.h),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NetworkPrinterSetupCard(
                        currentType: _printerType,
                        isDiscovering: bloc.state.isDiscoveringPrinter,
                        onTypeChanged: (type) {
                          setState(() => _printerType = type);
                          setStateModal(() {});
                        },
                        onDiscover: () =>
                            bloc.add(const DiscoverPrinterEvent()),
                        onTestPrint: () => bloc.add(const TestPrintEvent()),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        height: 46.h,
                        child: ElevatedButton(
                          onPressed: () {
                            _save(context, bloc.state.settings);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            AppStrings.savePrinterSettings,
                            style: textTheme.titleMedium?.copyWith(
                              color: colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _openInvoiceTaxModal(BuildContext context) {
    final bloc = context.read<AdminSystemSettingsBloc>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        final colorScheme = Theme.of(context).colorScheme;
        final textTheme = Theme.of(context).textTheme;

        return Container(
          padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 24.h),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InvoiceDetailsCard(
                  cafeNameController: _cafeNameController,
                  welcomeMsgController: _welcomeMsgController,
                ),
                SizedBox(height: 16.h),
                TaxServiceCard(
                  vatController: _vatController,
                  serviceChargeController: _serviceChargeController,
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  height: 46.h,
                  child: ElevatedButton(
                    onPressed: () {
                      _save(context, bloc.state.settings);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      AppStrings.saveDetails,
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openLanguageModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        final isArabic = context.read<LocaleCubit>().isArabic;
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        return Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.chooseLanguage,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 16.h),
              ListTile(
                leading: Text('🇪🇬', style: textTheme.titleLarge),
                title: Text(AppStrings.arabicMasri, style: textTheme.bodyLarge),
                trailing: isArabic
                    ? Icon(
                        Icons.check_circle_rounded,
                        color: theme.primaryColor,
                      )
                    : null,
                onTap: () {
                  context.read<LocaleCubit>().setLocale(const Locale('ar'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Text('🇬🇧', style: textTheme.titleLarge),
                title: Text(AppStrings.english, style: textTheme.bodyLarge),
                trailing: !isArabic
                    ? Icon(
                        Icons.check_circle_rounded,
                        color: theme.primaryColor,
                      )
                    : null,
                onTap: () {
                  context.read<LocaleCubit>().setLocale(const Locale('en'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _openThemeModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        final currentMode = context.read<ThemeCubit>().state;
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        return Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.themeSettings,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 16.h),
              ListTile(
                leading: const Icon(Icons.brightness_auto_rounded),
                title: Text(AppStrings.systemDefault, style: textTheme.bodyLarge),
                trailing: currentMode == ThemeMode.system
                    ? Icon(
                        Icons.check_circle_rounded,
                        color: theme.primaryColor,
                      )
                    : null,
                onTap: () {
                  context.read<ThemeCubit>().setThemeMode(ThemeMode.system);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.light_mode_rounded),
                title: Text(AppStrings.lightMode, style: textTheme.bodyLarge),
                trailing: currentMode == ThemeMode.light
                    ? Icon(
                        Icons.check_circle_rounded,
                        color: theme.primaryColor,
                      )
                    : null,
                onTap: () {
                  context.read<ThemeCubit>().setThemeMode(ThemeMode.light);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.dark_mode_rounded),
                title: Text(AppStrings.darkMode, style: textTheme.bodyLarge),
                trailing: currentMode == ThemeMode.dark
                    ? Icon(
                        Icons.check_circle_rounded,
                        color: theme.primaryColor,
                      )
                    : null,
                onTap: () {
                  context.read<ThemeCubit>().setThemeMode(ThemeMode.dark);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _openProfileModal(BuildContext context) {
    final name = _currentUser?.fullName.isNotEmpty == true
        ? _currentUser!.fullName
        : AppStrings.captainName;
    final email = _currentUser?.email.isNotEmpty == true
        ? _currentUser!.email
        : 'sarah@espressologic.com';
    final role = _currentUser?.role.isNotEmpty == true
        ? _currentUser!.role
        : 'Store Manager';

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final textTheme = theme.textTheme;

        return Container(
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 36.r,
                backgroundColor: theme.primaryColor,
                child: Text(
                  name[0].toUpperCase(),
                  style: textTheme.displayMedium?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                name,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                email,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 8.h),
              Chip(
                label: Text(
                  role,
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
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

    final userName = _currentUser?.fullName.isNotEmpty == true
        ? _currentUser!.fullName
        : AppStrings.captainName;
    final userEmail = _currentUser?.email.isNotEmpty == true
        ? _currentUser!.email
        : 'sarah@espressologic.com';

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: BlocConsumer<AdminSystemSettingsBloc, AdminSystemSettingsState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              AppNotificationService.showError(context, state.errorMessage!);
            }
            if (state.successMessage != null) {
              AppNotificationService.showSuccess(
                context,
                state.successMessage!,
              );
            }
            if (state.settings != null) {
              _populateFields(state.settings!);
            }
          },
          builder: (context, state) {
            final isArabic = context.read<LocaleCubit>().isArabic;
            final currentThemeMode = context.watch<ThemeCubit>().state;
            final themeLabel = currentThemeMode == ThemeMode.light
                ? AppStrings.lightMode
                : (currentThemeMode == ThemeMode.dark
                    ? AppStrings.darkMode
                    : AppStrings.systemDefault);

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Profile Header
                  SizedBox(height: 10.h),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          userName,
                          textAlign: TextAlign.center,
                          style: textTheme.headlineSmall,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          userEmail,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Section 1: General
                  _SectionHeaderTitle(title: AppStrings.general),
                  _SetupOptionTile(
                    icon: Icons.person_outline_rounded,
                    title: AppStrings.editProfile,
                    onTap: () => _openProfileModal(context),
                  ),
                  _SetupOptionTile(
                    icon: Icons.lock_outline_rounded,
                    title: AppStrings.changePassword,
                    onTap: () => _openProfileModal(context),
                  ),
                  _SetupOptionTile(
                    icon: Icons.restaurant_menu_outlined,
                    title: AppStrings.menuSetup,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AdminMenuManagementPage(),
                        ),
                      );
                    },
                  ),
                  _SetupOptionTile(
                    icon: Icons.table_restaurant_outlined,
                    title: AppStrings.tablesAndFloorSetup,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AdminPlaceSetupPage(),
                        ),
                      );
                    },
                  ),
                  _SetupOptionTile(
                    icon: Icons.print_outlined,
                    title: AppStrings.printerSetup,
                    onTap: () => _openPrinterSetupModal(context),
                  ),
                  _SetupOptionTile(
                    icon: Icons.receipt_long_outlined,
                    title: AppStrings.invoiceAndTaxDetails,
                    onTap: () => _openInvoiceTaxModal(context),
                  ),

                  SizedBox(height: 12.h),

                  // Section 2: Preferences
                  _SectionHeaderTitle(title: AppStrings.preferences),
                  _SetupOptionTile(
                    icon: Icons.language_outlined,
                    title: AppStrings.chooseLanguage,
                    value: isArabic ? AppStrings.arabicMasri : AppStrings.english,
                    onTap: () => _openLanguageModal(context),
                  ),
                  _SetupOptionTile(
                    icon: Icons.palette_outlined,
                    title: AppStrings.themeSettings,
                    value: themeLabel,
                    onTap: () => _openThemeModal(context),
                  ),

                  SizedBox(height: 12.h),

                  // Section 3: Account
                  _SectionHeaderTitle(title: AppStrings.account),
                  _SetupOptionTile(
                    icon: Icons.logout_rounded,
                    title: AppStrings.logoutStation,
                    isDestructive: true,
                    onTap: () async {
                      await getIt<AuthRepository>().logout();
                      if (context.mounted) {
                        const LoginRoute().go(context);
                      }
                    },
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SectionHeaderTitle extends StatelessWidget {
  final String title;

  const _SectionHeaderTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 8.h, bottom: 12.h),
      child: Text(
        title,
        style: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}

class _SetupOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  final VoidCallback onTap;
  final bool isDestructive;

  const _SetupOptionTile({
    required this.icon,
    required this.title,
    this.value,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDestructive
              ? colorScheme.error.withValues(alpha: 0.3)
              : colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.02),
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 22.r,
                  color: isDestructive
                      ? colorScheme.error
                      : colorScheme.onSurface,
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Text(
                    title,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isDestructive
                          ? colorScheme.error
                          : colorScheme.onSurface,
                    ),
                  ),
                ),
                if (value != null) ...[
                  Text(
                    value!,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8.w),
                ],
                Icon(
                  Icons.chevron_right_rounded,
                  size: 22.r,
                  color: isDestructive
                      ? colorScheme.error.withValues(alpha: 0.7)
                      : colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
