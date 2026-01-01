import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/course_model.dart';
import '../../../../../core/models/create_course_dto.dart';
import '../../../../../core/utils/functions/string_fun.dart';
import '../../../../../core/widgets/custom_action_buttons.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../logic/cubit/instructor_courses_cubit.dart';

import 'widgets/add_edit_course/add_edit_course_form_body.dart';
import 'widgets/add_edit_course/form_controllers.dart';

class AddEditCourseScreen extends StatefulWidget {
  const AddEditCourseScreen({super.key, this.course});

  final CourseModel? course;

  @override
  State<AddEditCourseScreen> createState() => _AddEditCourseScreenState();
}

class _AddEditCourseScreenState extends State<AddEditCourseScreen> {
  final _formKey = GlobalKey<FormState>();
  late final _formControllers = FormControllers();

  bool get _isEditMode => widget.course != null;

  @override
  void initState() {
    super.initState();
    _formControllers.initialize(widget.course);
    _formControllers.youtubeUrlController.addListener(_updateThumbnail);
    _updateThumbnail();
  }

  @override
  void dispose() {
    _formControllers.dispose();
    super.dispose();
  }

  void _updateThumbnail() {
    final thumbnail = getYoutubeThumbnail(
      _formControllers.youtubeUrlController.text.trim(),
    );

    if (_formControllers.thumbnailUrl != thumbnail) {
      _formControllers.thumbnailUrl = thumbnail;
      setState(() {});
    }
  }

  Future<void> _submitForm({required final bool submitForReview}) async {
    if (!_formKey.currentState!.validate()) return;

    final cubit = context.read<InstructorCoursesCubit>();

    if (_isEditMode) {
      final updatedCourse = widget.course!.copyWith(
        title: _formControllers.titleController.text.trim(),
        description: _formControllers.descriptionController.text.trim(),
        category: _formControllers.categoryController.text.trim(),
        youtubeUrl: _formControllers.youtubeUrlController.text.trim(),
        thumbnailUrl: _formControllers.thumbnailUrl,
        status: submitForReview ? CourseStatus.pending : CourseStatus.draft,
        learningPoints: _formControllers.learningPointsController.text
            .split('\n')
            .map((final e) => e.trim())
            .where((final e) => e.isNotEmpty)
            .toList(),
      );

      cubit.updateCourse(course: updatedCourse);
    } else {
      final dto = CreateCourseDto(
        title: _formControllers.titleController.text.trim(),
        description: _formControllers.descriptionController.text.trim(),
        category: _formControllers.categoryController.text.trim(),
        youtubeUrl: _formControllers.youtubeUrlController.text.trim(),
        thumbnailUrl: _formControllers.thumbnailUrl,
        status: submitForReview ? CourseStatus.pending : CourseStatus.draft,
        learningPoints: _formControllers.learningPointsController.text
            .split('\n')
            .map((final e) => e.trim())
            .where((final e) => e.isNotEmpty)
            .toList(),
      );

      cubit.addCourse(dto: dto);
    }
  }

  @override
  Widget build(final BuildContext context) {
    return BlocListener<InstructorCoursesCubit, InstructorCoursesState>(
      listener: (final context, final state) {
        if (state is InstructorCoursesOperationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Course saved successfully')),
          );
          Navigator.pop(context);
        }

        if (state is InstructorCoursesError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          bottom: false,
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
                  child: AddEditCourseFormBody(controllers: _formControllers),
                ),
              ),

              _ActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<InstructorCoursesCubit, InstructorCoursesState>(
      builder: (final context, final state) {
        final isLoading = state is InstructorCoursesLoading;

        return CustomActionButtons(
          isLoading: isLoading,
          onTap1Text: 'instructor_course_create.save'.tr(),
          onTap2Text: 'instructor_course_create.submit_for_review'.tr(),
          onTap1: isLoading
              ? null
              : () => context
                    .findAncestorStateOfType<_AddEditCourseScreenState>()!
                    ._submitForm(submitForReview: false),
          onTap2: isLoading
              ? null
              : () => context
                    .findAncestorStateOfType<_AddEditCourseScreenState>()!
                    ._submitForm(submitForReview: true),
        );
      },
    );
  }
}
