import 'package:flutter/material.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';

import '../../../../../core/router/routes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Admin Dashboard", style: AppTextStyles.font24Bold),
          verticalSpacing(20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed(Routes.onBoardingScreen);
              },
              child: const Text('go to start'),
            ),
          ),
        ],
      ),
    );
  }
}
