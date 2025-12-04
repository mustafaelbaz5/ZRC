import 'package:flutter/material.dart';
import 'package:zrc/core/auth/data/model/user_model.dart';
import 'package:zrc/core/utils/functions/app_language.dart';
import 'package:zrc/modules/student/features/profile/ui/widgets/profile_personal_info/profile_info_display_item.dart';
import 'package:zrc/modules/student/features/profile/ui/widgets/profile_section_body.dart';

class ProfilePersonalInfoSection extends StatelessWidget {
  final UserModel user;
  final bool isArabic;
  const ProfilePersonalInfoSection({
    super.key,
    required this.user,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileSectionBody(
      title: 'Personal Information',
      items: [
        ProfileInfoDisplayItem(
          icon: Icons.person_outline,
          title: 'Full Name',
          value: isArabic ? user.name : changeNameToEn(context, user.name),
        ),
        ProfileInfoDisplayItem(
          icon: Icons.email_outlined,
          title: 'Email',
          value: user.email,
        ),
        ProfileInfoDisplayItem(
          icon: Icons.badge_outlined,
          title: 'Student Code',
          value: user.studentCode.toString(),
        ),
        if (user.college != null)
          ProfileInfoDisplayItem(
            icon: Icons.school_outlined,
            title: 'College',
            value: user.college!,
          ),
        if (user.phoneNumber != null)
          ProfileInfoDisplayItem(
            icon: Icons.phone_outlined,
            title: 'Phone Number',
            value: user.phoneNumber!,
          ),
        if (user.nationalId != null)
          ProfileInfoDisplayItem(
            icon: Icons.credit_card_outlined,
            title: 'National ID',
            value: user.nationalId.toString(),
          ),
      ],
    );
  }
}
