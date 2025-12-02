import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/extensions/navigation.dart';
import '../../../../../../../core/router/routes.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';
import '../../../data/model/quiz_model.dart';
import 'attempts_info.dart';
import 'difficulty_badge.dart';
import 'due_date_info.dart';
import 'quiz_detail_item.dart';
import 'status_badge.dart';

class QuizCard extends StatelessWidget {
  final QuizModel quiz;

  const QuizCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.pushNamed(
            Routes.studentQuizDetailedScreen,
            arguments: {'quiz': quiz},
          );
        },
        borderRadius: BorderRadius.circular(20.r),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                quiz.attemptStatus == QuizAttemptStatus.completed
                    ? Colors.green.withAlpha(5)
                    : Colors.blue.withAlpha(5),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(10),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: quiz.attemptStatus == QuizAttemptStatus.completed
                  ? Colors.green.withAlpha(20)
                  : Colors.blue.withAlpha(20),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: Title & Status Badge
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quiz.title,
                            style: AppTextStyles.font20BlackBold,
                          ),
                          verticalSpacing(6),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withAlpha(10),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Text(
                                  quiz.subject,
                                  style: AppTextStyles.font13BlueBold,
                                ),
                              ),
                              SizedBox(width: 8.w),
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
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Text(
                      quiz.description,
                      style: AppTextStyles.font13greyRegular,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                // Instructor Info
                Row(
                  children: [
                    CircleAvatar(
                      radius: 14.r,
                      backgroundColor: Colors.blue[100],
                      child: quiz.instructorAvatar != null
                          ? null
                          : Icon(
                              Icons.person,
                              size: 16.sp,
                              color: Colors.blue[700],
                            ),
                    ),
                    horizontalSpacing(8),
                    Expanded(
                      child: Text(
                        quiz.instructorName,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),

                verticalSpacing(14),
                // Divider
                const Divider(color: Colors.white, height: 2),

                verticalSpacing(14),

                // Quiz Details Grid
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuizDetailItem(
                      icon: Icons.help_outline_rounded,
                      label: '${quiz.questionsCount} Questions',
                      color: Colors.purple,
                    ),
                    QuizDetailItem(
                      icon: Icons.timer_outlined,
                      label: '${quiz.duration} mins',
                      color: Colors.orange,
                    ),
                    QuizDetailItem(
                      icon: Icons.grade_outlined,
                      label: '${quiz.totalMarks} marks',
                      color: Colors.teal,
                    ),
                  ],
                ),

                SizedBox(height: 14.h),

                // Footer: Due Date & Attempts
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DueDateInfo(dueDate: quiz.dueDate),
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
