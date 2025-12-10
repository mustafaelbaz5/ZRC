import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/auth/data/model/user_model.dart';
import '../../../quizzes/ui/widgets/quiz_detailed/stat_card.dart';

class ProfileStatsCards extends StatelessWidget {
  final UserModel user;

  const ProfileStatsCards({super.key, required this.user});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: <Widget>[
          Expanded(
            child: StatCard(
              icon: Icons.school_outlined,
              value: '12',
              label: 'student_profile.stats.courses'.tr(),
              color: Colors.purple,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: StatCard(
              icon: Icons.quiz_outlined,
              value: '28',
              label: 'student_profile.stats.quizzes'.tr(),
              color: Colors.orange,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: StatCard(
              icon: Icons.grade_outlined,
              value: '87%',
              label: 'student_profile.stats.avg_score'.tr(),
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
