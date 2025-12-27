import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/themes/app_colors.dart';

import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';

class QuizDetailedAppBar extends StatelessWidget {
  const QuizDetailedAppBar({super.key, required this.quiz});

  final QuizModel quiz;

  @override
  Widget build(final BuildContext context) {
    return SliverAppBar(
      expandedHeight: responsiveHeight(200),
      pinned: true,
      backgroundColor: AppColors.primary400,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.grey0,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[AppColors.primary400, AppColors.primary200],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                responsiveWidth(20),
                responsiveHeight(60),
                responsiveWidth(20),
                responsiveHeight(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(12),
                      vertical: responsiveHeight(6),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.grey0.withAlpha((0.04 * 255).toInt()),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      quiz.subject,
                      style: AppTextStyles.font13Bold.copyWith(
                        color: AppColors.grey0,
                      ),
                    ),
                  ),
                  verticalSpacing(12),
                  Text(
                    quiz.title,
                    style: AppTextStyles.font24Bold.copyWith(
                      color: AppColors.grey0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
