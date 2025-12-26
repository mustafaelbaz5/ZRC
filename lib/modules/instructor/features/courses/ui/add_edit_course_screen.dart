import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/functions/string_fun.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/custom_app_bar.dart';
import 'package:zrc/core/widgets/custom_text_button.dart';
import 'package:zrc/modules/instructor/features/courses/data/models/instructor_course_model.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/category_section.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/description_section.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/learning_points_section.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/title_section.dart';
import 'package:zrc/modules/instructor/features/courses/ui/widgets/add_edit_course/you_tube_section.dart';

class AddEditCourseScreen extends StatefulWidget {
  const AddEditCourseScreen({super.key, this.course});

  final InstructorCourseModel? course;

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
  bool _isSubmitting = false;

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
      text: course?.learningPoints?.join('\n') ?? '',
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

  Future<void> _saveCourse({required final bool asDraft}) async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            asDraft
                ? 'instructor_course_create.saved_as_draft'.tr()
                : 'instructor_course_create.submitted_for_review'.tr(),
          ),
          backgroundColor: Colors.green.shade700,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(
            horizontal: responsiveWidth(20),
            vertical: responsiveHeight(10),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(responsiveRadius(12)),
          ),
        ),
      );

      Navigator.pop(context, true);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red.shade700,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
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
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    final colors = context.customColors;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(responsiveWidth(20)),
      decoration: BoxDecoration(
        color: colors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 16,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomTextButton(
                size: CustomButtonSize.medium,
                style: CustomButtonStyle.outlined,
                text: 'instructor_course_create.save_draft'.tr(),
                prefixIcon: const Icon(Icons.drafts_outlined),
                onPressed: _isSubmitting
                    ? null
                    : () => _saveCourse(asDraft: true),
                isLoading: _isSubmitting,
                textStyle: AppTextStyles.font14Regular.copyWith(
                  color: colors.textPrimary,
                ),
              ),
            ),
            horizontalSpacing(16),
            Expanded(
              flex: 3,
              child: CustomTextButton(
                size: CustomButtonSize.medium,
                style: CustomButtonStyle.filled,
                text: 'instructor_course_create.submit_for_review'.tr(),
                prefixIcon: const Icon(Icons.send_rounded),
                onPressed: _isSubmitting
                    ? null
                    : () => _saveCourse(asDraft: false),
                isLoading: _isSubmitting,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
