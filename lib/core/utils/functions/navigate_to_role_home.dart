import 'package:flutter/material.dart';

import '../../router/routes.dart';

void navigateToRoleHome(final BuildContext context, final String role) {
  switch (role) {
    case 'student':
      Navigator.pushReplacementNamed(context, Routes.studentScaffold);
      break;
    case 'instructor':
      Navigator.pushReplacementNamed(context, Routes.instructorScaffold);
      break;
    case 'admin':
      Navigator.pushReplacementNamed(context, Routes.adminHomeScreen);
      break;
    default:
      Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
  }
}
