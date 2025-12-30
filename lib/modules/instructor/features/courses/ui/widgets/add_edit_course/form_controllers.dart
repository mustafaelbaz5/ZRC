import 'package:flutter/material.dart';
import 'package:zrc/core/models/course_model.dart';

class FormControllers {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController youtubeUrlController;
  late final TextEditingController categoryController;
  late final TextEditingController learningPointsController;

  String? thumbnailUrl;

  void initialize(final CourseModel? course) {
    titleController = TextEditingController(text: course?.title);
    descriptionController = TextEditingController(text: course?.description);
    youtubeUrlController = TextEditingController(text: course?.youtubeUrl);
    categoryController = TextEditingController(text: course?.category);
    learningPointsController = TextEditingController(
      text: course?.learningPoints.join('\n'),
    );
  }

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    youtubeUrlController.dispose();
    categoryController.dispose();
    learningPointsController.dispose();
  }
}
