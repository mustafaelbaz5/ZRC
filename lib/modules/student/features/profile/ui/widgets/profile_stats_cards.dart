import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/utils/spacing.dart';

import '../../../../../../core/auth/data/model/user_model.dart';
import '../../../../core/widgets/stat_card.dart';

class ProfileStatsCards extends StatelessWidget {
  final UserModel user;

  const ProfileStatsCards({super.key, required this.user});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: StatCard(
              icon: Icons.school_outlined,
              value: '12',
              label: 'student_profile.stats.courses'.tr(),
              color: AppColors.primary200,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: StatCard(
              icon: Icons.quiz_outlined,
              value: '28',
              label: 'student_profile.stats.quizzes'.tr(),
              color: AppColors.warning200,
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: StatCard(
              icon: Icons.grade_outlined,
              value: '87%',
              label: 'student_profile.stats.avg_score'.tr(),
              color: AppColors.success200,
            ),
          ),
        ],
      ),
    );
  }
}
