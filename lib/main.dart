import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/app_strings.dart';
import 'core/data/tables_store.dart';
import 'core/di/injection.dart';
import 'core/localization/locale_cubit.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await getIt<TablesStore>().init();

  runApp(const EspressoLogicApp());
}

class EspressoLogicApp extends StatelessWidget {
  const EspressoLogicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocaleCubit>.value(
      value: getIt<LocaleCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, currentLocale) {
              final isArabic = currentLocale.languageCode == 'ar';

              return MaterialApp.router(
                title: AppStrings.appTitle,
                debugShowCheckedModeBanner: false,
                locale: currentLocale,
                supportedLocales: const [
                  Locale('ar'),
                  Locale('en'),
                ],
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                builder: (context, routerChild) {
                  return Directionality(
                    textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                    child: routerChild ?? const SizedBox.shrink(),
                  );
                },
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: ThemeMode.system,
                routerConfig: appRouter,
              );
            },
          );
        },
      ),
    );
  }
}