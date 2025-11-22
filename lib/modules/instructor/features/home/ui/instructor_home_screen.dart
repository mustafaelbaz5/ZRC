import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/navigation.dart';
import 'package:zrc/core/router/routes.dart';

class InstructorHomeScreen extends StatelessWidget {
  const InstructorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(Routes.onBoardingScreen);
          },
          child: const Text('go to start'),
        ),
      ),
    );
  }
}
