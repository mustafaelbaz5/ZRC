import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/auth/data/model/user_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_detailed/stat_card.dart';

class ProfileStatsCards extends StatelessWidget {
  final UserModel user;

  const ProfileStatsCards({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          const Expanded(
            child: StatCard(
              icon: Icons.school_outlined,
              value: '12',
              label: 'Courses',
              color: Colors.purple,
            ),
          ),
          SizedBox(width: 12.w),
          const Expanded(
            child: StatCard(
              icon: Icons.quiz_outlined,
              value: '28',
              label: 'Quizzes',
              color: Colors.orange,
            ),
          ),
          SizedBox(width: 12.w),
          const Expanded(
            child: StatCard(
              icon: Icons.grade_outlined,
              value: '87%',
              label: 'Avg Score',
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
