import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/auth/data/repo/auth_repo.dart';
import '../../../../../core/di/dependency_injection.dart';

import '../../../../../core/auth/data/model/user_model.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/utils/functions/app_setting_fun.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/logout_button.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_personal_info/profile_personal_info_section.dart';
import 'widgets/profile_settings/profile_settings.dart';
import 'widgets/profile_stats_cards.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  UserModel? _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final UserModel? user = await getIt<AuthRepo>().getCurrentUser();
      if (!mounted) return;
      setState(() {
        _user = user;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      debugPrint('Error loading user data: $e');
    }
  }

  @override
  Widget build(final BuildContext context) {
    if (_isLoading) {
      return const SafeArea(child: Center(child: CircularProgressIndicator()));
    }

    if (_user == null) {
      return SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error_outline,
                size: 64.sp,
                color: context.customColors.textSecondary,
              ),
              verticalSpacing(16),
              Text(
                'student_profile.unable_to_load'.tr(),
                style: AppTextStyles.font16Regular.copyWith(
                  color: context.customColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Column(
        children: <Widget>[
          CustomAppBar(
            title: 'student_profile.screen_title'.tr(),
            showNotificationIcon: false,
            showMenuIcon: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  verticalSpacing(20),
                  ProfileHeader(user: _user!),
                  verticalSpacing(24),
                  ProfileStatsCards(user: _user!),
                  verticalSpacing(24),
                  ProfilePersonalInfoSection(user: _user!),
                  verticalSpacing(16),
                  ProfileSettings(
                    onSwitchLanguageTap: () => switchLanguage(context),
                    onSwitchThemeTap: () => switchTheme(context),
                  ),
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
