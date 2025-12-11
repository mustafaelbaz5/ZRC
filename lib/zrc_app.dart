import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/router/app_router.dart';
import 'core/router/routes.dart';
import 'core/themes/app_theme.dart';
import 'core/themes/logic/theme_cubit.dart';

class ZrcApp extends StatelessWidget {
  const ZrcApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(final BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (final BuildContext context, final Widget? child) {
        return BlocProvider(
          create: (final BuildContext context) => ThemeCubit(),
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (final BuildContext context, final ThemeMode themeMode) {
              return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.initialScreen,
                onGenerateRoute: appRouter.generateRoute,
                title: 'ZRC - ZNU Robotics Community',
                themeMode: themeMode,
                theme: AppTheme.lightTheme.copyWith(
                  textTheme: context.locale.languageCode == 'ar'
                      ? GoogleFonts.tajawalTextTheme(
                          AppTheme.lightTheme.textTheme,
                        )
                      : GoogleFonts.interTextTheme(
                          AppTheme.lightTheme.textTheme,
                        ),
                ),
                darkTheme: AppTheme.darkTheme.copyWith(
                  textTheme: context.locale.languageCode == 'ar'
                      ? GoogleFonts.tajawalTextTheme(
                          AppTheme.darkTheme.textTheme,
                        )
                      : GoogleFonts.interTextTheme(
                          AppTheme.darkTheme.textTheme,
                        ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// dart format .  For Formate all Files 
//dart fix --apply  For apply Fixes