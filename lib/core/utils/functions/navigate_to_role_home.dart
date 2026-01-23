import 'package:flutter/material.dart';

import '../../extensions/context_extensions.dart';
import '../../router/routes.dart';

void navigateToRoleHome(final BuildContext context, final String role) {
  final String normalizedRole = role.trim().toLowerCase();
  debugPrint(
    'Navigating to role home for role: "$role" (normalized: "$normalizedRole")',
  );

  switch (normalizedRole) {
    case 'student':
      context.pushNamedAndRemoveAll(Routes.studentScaffold);
      break;
    case 'instructor':
      context.pushNamedAndRemoveAll(Routes.instructorScaffold);
      break;
    case 'admin':
      context.pushNamedAndRemoveAll(Routes.adminHomeScreen);
      break;
    default:
      debugPrint('Unknown role: "$role", navigating to OnBoarding');
      context.pushNamedAndRemoveAll(Routes.onBoardingScreen);
  }
}
