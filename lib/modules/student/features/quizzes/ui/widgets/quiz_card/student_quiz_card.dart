import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/router/routes.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';
import 'attempts_info.dart';
import 'difficulty_badge.dart';
import 'due_date_info.dart';
import 'quiz_detail_item.dart';
import 'status_badge.dart';

class StudentQuizCard extends StatelessWidget {
  final QuizModel quiz;

  const StudentQuizCard({super.key, required this.quiz});

  @override
  Widget build(final BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.pushNamed(
            Routes.studentQuizDetailedScreen,
            arguments: <String, QuizModel>{'quiz': quiz},
          );
        },
        borderRadius: BorderRadius.circular(20.r),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                context.customColors.surfaceVariant,
                quiz.attemptStatus == QuizAttemptStatus.completed
                    ? context.customColors.successContainer
                    : context.customColors.infoContainer,
              ],
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: context.customColors.surface.withAlpha(20),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: quiz.attemptStatus == QuizAttemptStatus.completed
                  ? context.customColors.successContainer.withAlpha(20)
                  : context.customColors.infoContainer.withAlpha(20),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(responsiveWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Header: Title & Status Badge
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(quiz.title, style: AppTextStyles.font20Bold),
                          verticalSpacing(6),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: responsiveWidth(8),
                                  vertical: responsiveHeight(4),
                                ),
                                decoration: BoxDecoration(
                                  color: context.customColors.surface.withAlpha(
                                    10,
                                  ),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Text(
                                  quiz.subject,
                                  style: AppTextStyles.font13Bold.copyWith(
                                    color: context.customColors.textSecondary,
                                  ),
                                ),
                              ),
                              horizontalSpacing(8),
                              DifficultyBadge(difficulty: quiz.difficulty),
                            ],
                          ),
                        ],
                      ),
                    ),
                    horizontalSpacing(12),
                    StatusBadge(
                      status: quiz.attemptStatus,
                      score: quiz.userScore,
                    ),
                  ],
                ),

                verticalSpacing(12),

                // Description
                if (quiz.description.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(bottom: responsiveHeight(12)),
                    child: Text(
                      quiz.description,
                      style: AppTextStyles.font13Regular.copyWith(
                        color: context.customColors.textSecondary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                // Instructor Info
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 14.r,
                      backgroundColor: AppColors.primary50,
                      child: quiz.instructorAvatar != null
                          ? null
                          : Icon(
                              Icons.person,
                              size: 16.sp,
                              color: AppColors.primary300,
                            ),
                    ),
                    horizontalSpacing(8),
                    Expanded(
                      child: Text(
                        quiz.instructorName,
                        style: AppTextStyles.font13Regular.copyWith(
                          color: context.customColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),

                verticalSpacing(14),
                // Divider
                Divider(color: context.customColors.textSecondary, height: 2),

                verticalSpacing(14),

                // Quiz Details Grid
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    QuizDetailItem(
                      icon: Icons.help_outline_rounded,
                      label:
                          '${quiz.questionsCount} ${tr('student_quizzes.quiz_card.questions')}',
                      color: Colors.purple,
                    ),
                    QuizDetailItem(
                      icon: Icons.timer_outlined,
                      label:
                          '${quiz.duration} ${tr('student_quizzes.quiz_card.minutes')}',
                      color: AppColors.warning50,
                    ),
                    QuizDetailItem(
                      icon: Icons.grade_outlined,
                      label:
                          '${quiz.totalMarks} ${tr('student_quizzes.quiz_card.marks')}',
                      color: Colors.teal,
                    ),
                  ],
                ),

                verticalSpacing(14),

                // Footer: Due Date & Attempts
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DueDateInfo(dueDate: quiz.dueDate),
                    verticalSpacing(14),
                    if (quiz.attemptsAllowed > 1)
                      AttemptsInfo(
                        attemptsUsed: quiz.attemptsUsed,
                        attemptsAllowed: quiz.attemptsAllowed,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
