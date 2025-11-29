import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/youtube_player_card.dart';

class CoursesDetailsScreen extends StatelessWidget {
  const CoursesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  horizontalSpacing(10),
                  Text("Title", style: AppTextStyles.font16BlackBold),
                ],
              ),
              verticalSpacing(16),
              const YoutubePlayerCard(videoUrl: 'https://youtu.be/7Z1FKSqVJYg?si=KMM6i81DgMZuSQjj',),
            ],
          ),
        ),
      ),
    );
  }
}

