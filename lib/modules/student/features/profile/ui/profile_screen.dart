import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/auth/data/model/user_model.dart';
import 'package:zrc/core/storage/user_storage.dart';
import 'package:zrc/core/utils/functions/app_language.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/core/widgets/custom_app_bar.dart';
import 'package:zrc/modules/student/features/profile/ui/widgets/logout_button.dart';
import 'package:zrc/modules/student/features/profile/ui/widgets/profile_header.dart';
import 'package:zrc/modules/student/features/profile/ui/widgets/profile_personal_info/profile_personal_info_section.dart';
import 'package:zrc/modules/student/features/profile/ui/widgets/profile_settings/profile_settings.dart';
import 'package:zrc/modules/student/features/profile/ui/widgets/profile_stats_cards.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _onChangeLanguage() {
    switchLanguage(context);
    setState(() {});
  }

  Future<void> _loadUserData() async {
    try {
      final userStorage = UserStorage();
      final user = await userStorage.getUser();
      setState(() {
        _user = user;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint('Error loading user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = isAppLanguageArabic(context);
    if (_isLoading) {
      return const SafeArea(child: Center(child: CircularProgressIndicator()));
    }

    if (_user == null) {
      return SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64.sp, color: Colors.grey[400]),
              verticalSpacing(16),
              Text(
                'student_profile.unable_to_load'.tr(),
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            title: 'student_profile.screen_title'.tr(),
            showNotificationIcon: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpacing(20),
                  ProfileHeader(user: _user!, isArabic: isArabic),
                  verticalSpacing(24),
                  ProfileStatsCards(user: _user!),
                  verticalSpacing(24),
                  ProfilePersonalInfoSection(user: _user!, isArabic: isArabic),
                  verticalSpacing(16),
                  ProfileSettings(onSwitchLanguageTap: _onChangeLanguage),
                  verticalSpacing(16),
                  const LogoutButton(),
                  verticalSpacing(24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
