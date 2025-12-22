import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/instructor/features/home/ui/widgets/quick_action_button.dart';

class InstructorQuickActionsButton extends StatelessWidget {
  const InstructorQuickActionsButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: QuickActionButton(
                  title: tr('instructor_home.quick_actions.create_course'),
                  icon: Icons.add_box_rounded,
                  onTap: () {},
                ),
              ),
              horizontalSpacing(12),
              Expanded(
                child: QuickActionButton(
                  title: tr('instructor_home.quick_actions.create_video'),
                  icon: Icons.video_library_rounded,
                  onTap: () {},
                ),
              ),
            ],
          ),
          verticalSpacing(12),
          Row(
            children: [
              Expanded(
                child: QuickActionButton(
                  title: tr('instructor_home.quick_actions.create_quiz'),
                  icon: Icons.quiz_rounded,
                  onTap: () {},
                ),
              ),
              horizontalSpacing(12),
              Expanded(
                child: QuickActionButton(
                  title: tr('instructor_home.quick_actions.create_assignment'),
                  icon: Icons.pending_actions_rounded,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
