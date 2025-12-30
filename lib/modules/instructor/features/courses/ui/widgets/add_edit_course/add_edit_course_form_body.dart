import 'package:flutter/material.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/category_section.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/description_section.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/form_controllers.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/learning_points_section.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/title_section.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/you_tube_section.dart';

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
