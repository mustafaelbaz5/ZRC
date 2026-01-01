import 'package:flutter/material.dart';
import '../../../../../../../core/utils/spacing.dart';
import 'category_section.dart';
import 'description_section.dart';
import 'form_controllers.dart';
import 'learning_points_section.dart';
import 'title_section.dart';
import 'you_tube_section.dart';

class AddEditCourseFormBody extends StatelessWidget {
  const AddEditCourseFormBody({super.key, required this.controllers});

  final FormControllers controllers;

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(20),
        vertical: responsiveHeight(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YouTubeSection(
            controller: controllers.youtubeUrlController,
            thumbnailUrl: controllers.thumbnailUrl,
          ),
          verticalSpacing(28),
          TitleSection(controller: controllers.titleController),
          verticalSpacing(28),
          DescriptionSection(controller: controllers.descriptionController),
          verticalSpacing(28),
          CategorySection(controller: controllers.categoryController),
          verticalSpacing(28),
          LearningPointsSection(
            controller: controllers.learningPointsController,
          ),
          verticalSpacing(100),
        ],
      ),
    );
  }
}
