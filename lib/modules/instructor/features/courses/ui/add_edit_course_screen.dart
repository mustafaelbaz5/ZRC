import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/models/course_model.dart';

import '../../../../../core/utils/functions/string_fun.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'widgets/add_edit_course/category_section.dart';
import 'widgets/add_edit_course/description_section.dart';
import 'widgets/add_edit_course/learning_points_section.dart';
import 'widgets/add_edit_course/title_section.dart';
import 'widgets/add_edit_course/you_tube_section.dart';
import 'widgets/instructor_course_action_buttons.dart';

class AddEditCourseScreen extends StatefulWidget {
  const AddEditCourseScreen({super.key, this.course});

  final CourseModel? course;

  @override
  State<AddEditCourseScreen> createState() => _AddEditCourseScreenState();
}

class _AddEditCourseScreenState extends State<AddEditCourseScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _youtubeUrlController;
  late final TextEditingController _categoryController;
  late final TextEditingController _learningPointsController;

  String? _thumbnailUrl;

  bool get _isEditMode => widget.course != null;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _youtubeUrlController.addListener(_updateThumbnail);
  }

  void _initializeControllers() {
    final course = widget.course;
    _titleController = TextEditingController(text: course?.title ?? '');
    _descriptionController = TextEditingController(
      text: course?.description ?? '',
    );
    _youtubeUrlController = TextEditingController(
      text: course?.youtubeUrl ?? '',
    );
    _categoryController = TextEditingController(text: course?.category ?? '');
    _learningPointsController = TextEditingController(
      text: course?.learningPoints.join('\n') ?? '',
    );
    _updateThumbnail(); // Initial thumbnail
  }

  void _updateThumbnail() {
    setState(() {
      _thumbnailUrl = getYoutubeThumbnail(_youtubeUrlController.text.trim());
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _youtubeUrlController.dispose();
    _categoryController.dispose();
    _learningPointsController.dispose();
    _youtubeUrlController.removeListener(_updateThumbnail);
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              showBackButton: true,
              title: _isEditMode
                  ? 'instructor_course_create.edit_title'.tr()
                  : 'instructor_course_create.title'.tr(),
              showNotificationIcon: false,
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(20),
                    vertical: responsiveHeight(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      YouTubeSection(
                        controller: _youtubeUrlController,
                        thumbnailUrl: _thumbnailUrl,
                      ),
                      verticalSpacing(28),
                      TitleSection(controller: _titleController),
                      verticalSpacing(28),
                      DescriptionSection(controller: _descriptionController),
                      verticalSpacing(28),
                      CategorySection(controller: _categoryController),
                      verticalSpacing(28),
                      LearningPointsSection(
                        controller: _learningPointsController,
                      ),
                      verticalSpacing(80),
                    ],
                  ),
                ),
              ),
            ),
            InstructorCourseActionButtons(
              onTap1: () {},
              onTap2: () {},
              onTap1Text: 'instructor_course_create.save_draft'.tr(),
              onTap2Text: 'instructor_course_create.submit_for_review'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
