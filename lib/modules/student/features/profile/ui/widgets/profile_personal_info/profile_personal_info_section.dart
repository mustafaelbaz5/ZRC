import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/utils/functions/string_fun.dart';

import '../../../../../../../core/auth/data/model/user_model.dart';
import '../profile_section_body.dart';
import 'profile_info_display_item.dart';

class ProfilePersonalInfoSection extends StatelessWidget {
  final UserModel user;
  const ProfilePersonalInfoSection({super.key, required this.user});

  @override
  Widget build(final BuildContext context) {
    return ProfileSectionBody(
      title: 'student_profile.personal_information.title'.tr(),
      items: <Widget>[
        ProfileInfoDisplayItem(
          icon: Icons.person_outline,
          title: 'student_profile.personal_information.full_name'.tr(),
          value: context.isArabic
              ? user.name
              : convertNamesToEn(context, user.name),
        ),
        ProfileInfoDisplayItem(
          icon: Icons.email_outlined,
          title: 'student_profile.personal_information.email'.tr(),
          value: user.email,
          copyToClipboard: true,
        ),
        ProfileInfoDisplayItem(
          icon: Icons.badge_outlined,
          title: 'student_profile.personal_information.student_code'.tr(),
          value: user.studentCode.toString(),
          copyToClipboard: true,
        ),

        if (user.college != null)
          ProfileInfoDisplayItem(
            icon: Icons.school_outlined,
            title: 'student_profile.personal_information.college'.tr(),
            value: user.college!,
          ),
        if (user.phoneNumber != null)
          ProfileInfoDisplayItem(
            icon: Icons.phone_outlined,
            title: 'student_profile.personal_information.phone_number'.tr(),
            value: user.phoneNumber!,
          ),
        if (user.nationalId != null)
          ProfileInfoDisplayItem(
            icon: Icons.credit_card_outlined,
            title: 'student_profile.personal_information.national_id'.tr(),
            value: user.nationalId.toString(),
            copyToClipboard: true,
          ),
      ],
    );
  }
}
