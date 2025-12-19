import 'package:flutter/material.dart';

class InstructorQuizzesScreen extends StatelessWidget {
  const InstructorQuizzesScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quizzes & Content')),
      body: const Center(child: Text('Quizzes Management Screen')),
    );
  }
}
