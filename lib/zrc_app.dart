import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/cubit/theme_cubit.dart';
import 'package:zrc/core/themes/theme_data/theme_data_dark.dart';
import 'package:zrc/core/themes/theme_data/theme_data_light.dart';

import 'core/router/app_router.dart';
import 'core/router/routes.dart';

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
                key: ValueKey(context.locale),
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.initialScreen,
                onGenerateRoute: appRouter.generateRoute,
                title: 'ZRC - ZNU Robotics Community',
                theme: getLightTheme(context: context),
                darkTheme: getDarkTheme(context: context),
                themeMode: themeMode,
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