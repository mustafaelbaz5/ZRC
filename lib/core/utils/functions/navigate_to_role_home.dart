import 'package:flutter/material.dart';
import 'package:zrc/core/router/routes.dart';

void navigateToRoleHome(BuildContext context, String role) {
  switch (role) {
    case 'student':
      Navigator.pushReplacementNamed(context, Routes.studentScaffold);
      break;
    case 'instructor':
      Navigator.pushReplacementNamed(context, Routes.instructorHomeScreen);
      break;
    case 'admin':
      Navigator.pushReplacementNamed(context, Routes.adminHomeScreen);
      break;
    default:
      Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
  }
}
