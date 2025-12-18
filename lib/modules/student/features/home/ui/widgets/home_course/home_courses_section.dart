import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/router/routes.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/home/ui/widgets/home_course/home_courses_list_view.dart';

class HomeCoursesSection extends StatelessWidget {
  const HomeCoursesSection({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              tr('student_home.courses_title'),
              style: AppTextStyles.font18Bold,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.studentCoursesScreen);
              },
              child: Row(
                children: [
                  Text(
                    tr('student_home.see_all'),
                    style: AppTextStyles.font13Bold.copyWith(
                      color: context.customColors.textPrimary,
                    ),
                  ),
                  horizontalSpacing(4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: context.customColors.textPrimary,
                  ),
                ],
              ),
            ),
          ],
        ),
        verticalSpacing(16),
        const HomeCoursesListView(),
      ],
    );
  }
}
