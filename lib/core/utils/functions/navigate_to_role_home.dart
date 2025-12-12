import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';

import '../../router/routes.dart';

void navigateToRoleHome(final BuildContext context, final String role) {
  switch (role) {
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
      context.pushNamedAndRemoveAll(Routes.onBoardingScreen);
  }
}
