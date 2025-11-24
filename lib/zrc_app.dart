import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/app_router.dart';
import 'core/router/routes.dart';
import 'core/themes/app_colors.dart';

class ZrcApp extends StatelessWidget {
  const ZrcApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.initialScreen,
          onGenerateRoute: appRouter.generateRoute,
          title: 'ZRC - ZNU Robotics Community',
          theme: ThemeData(
            primaryColor: AppColors.darkBlue,
            scaffoldBackgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
