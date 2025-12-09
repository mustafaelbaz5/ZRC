import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../../core/auth/data/model/user_model.dart';
import '../../../../../../../core/utils/functions/app_language.dart';
import 'profile_info_display_item.dart';
import '../profile_section_body.dart';

class ProfilePersonalInfoSection extends StatelessWidget {
  final UserModel user;
  final bool isArabic;
  const ProfilePersonalInfoSection({
    super.key,
    required this.user,
    required this.isArabic,
  });

  @override
  Widget build(final BuildContext context) {
    return ProfileSectionBody(
      title: 'student_profile.personal_information.title'.tr(),
      items: <Widget>[
        ProfileInfoDisplayItem(
          icon: Icons.person_outline,
          title: 'student_profile.personal_information.full_name'.tr(),
          value: isArabic ? user.name : changeNameToEn(context, user.name),
        ),
        ProfileInfoDisplayItem(
          icon: Icons.email_outlined,
          title: 'student_profile.personal_information.email'.tr(),
          value: user.email,
        ),
        ProfileInfoDisplayItem(
          icon: Icons.badge_outlined,
          title: 'student_profile.personal_information.student_code'.tr(),
          value: user.studentCode.toString(),
          actionIcon: Icons.copy,
          onActionTap: () {
            Clipboard.setData(ClipboardData(text: user.studentCode.toString()));

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("student_profile.copy_to_clipboard".tr()),
                duration: const Duration(seconds: 1),
              ),
            );
          },
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
            actionIcon: Icons.copy,
            onActionTap: () {
              Clipboard.setData(
                ClipboardData(text: user.studentCode.toString()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("student_profile.copy_to_clipboard".tr()),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
      ],
    );
  }
}
