import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import '../../../../../../core/config/constants.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../core/utils/functions/string_fun.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/upload_image_field.dart';

import '../../../../../../core/auth/data/model/user_model.dart';
import '../../../../../../core/storage/secure_storage.dart';

class ProfileHeader extends StatefulWidget {
  final UserModel user;

  const ProfileHeader({super.key, required this.user});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  final SecureStorage _secureStorage = SecureStorage();
  File? _profileImage;

  // ================= Lifecycle =================

  @override
  void initState() {
    super.initState();
    _restoreProfileImage();
  }

  // ================= Image Persistence =================

  /// Save picked image into app directory (permanent)
  Future<File> _saveImagePermanently(final File image) async {
    final directory = await getApplicationDocumentsDirectory();

    final fileName =
        'profile_${DateTime.now().millisecondsSinceEpoch}${path.extension(image.path)}';

    return image.copy(path.join(directory.path, fileName));
  }

  /// Restore image path from secure storage
  Future<void> _restoreProfileImage() async {
    final storedPath = await _secureStorage.getString(
      key: Constants.profileImagePath,
    );

    if (!mounted) return;

    if (storedPath != null && File(storedPath).existsSync()) {
      setState(() => _profileImage = File(storedPath));
    }
  }

  /// Handle new image selection
  Future<void> _handleImageSelected(final File? image) async {
    if (image == null) return;

    final File permanentImage = await _saveImagePermanently(image);

    await _secureStorage.saveString(
      key: Constants.profileImagePath,
      value: permanentImage.path,
    );

    if (!mounted) return;
    setState(() => _profileImage = permanentImage);
  }

  @override
  Widget build(final BuildContext context) {
    final bool isArabic = context.isArabic;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(20),
        vertical: responsiveHeight(24),
      ),
      decoration: _headerDecoration(context),
      child: Column(
        children: [
          /// Profile Image
          UploadImageField(
            initialImage: _profileImage,
            onImageSelected: _handleImageSelected,
          ),

          verticalSpacing(20),

          _UserName(name: widget.user.name, isArabic: isArabic),

          verticalSpacing(6),

          _UserEmail(email: widget.user.email),

          verticalSpacing(16),

          _StudentIdBadge(code: "${widget.user.studentCode}"),
        ],
      ),
    );
  }

  BoxDecoration _headerDecoration(final BuildContext context) {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          AppColors.openBlue600,
          AppColors.primary200,
          AppColors.primary400,
          AppColors.openBlue600,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(26.r),
      boxShadow: [
        BoxShadow(
          color: AppColors.primary400.withAlpha(60),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}

class _UserName extends StatelessWidget {
  final String name;
  final bool isArabic;

  const _UserName({required this.name, required this.isArabic});

  @override
  Widget build(final BuildContext context) {
    return Text(
      isArabic
          ? getFirstNWords(name)
          : convertNamesToEn(context, getFirstNWords(name)),
      textAlign: TextAlign.center,
      style: AppTextStyles.font24Bold.copyWith(
        color: AppColors.grey0,
        height: 1.3,
      ),
    );
  }
}

class _UserEmail extends StatelessWidget {
  final String email;

  const _UserEmail({required this.email});

  @override
  Widget build(final BuildContext context) {
    return Text(
      email,
      style: AppTextStyles.font14Regular.copyWith(
        color: AppColors.grey0.withAlpha(220),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _StudentIdBadge extends StatelessWidget {
  final String code;

  const _StudentIdBadge({required this.code});

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.grey0.withAlpha(45),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: AppColors.grey0.withAlpha(65)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.badge_rounded, size: 18.sp, color: AppColors.grey0),
          horizontalSpacing(8),
          Text(
            '${'student_profile.header.id_label'.tr()}: $code',
            style: AppTextStyles.font14Bold.copyWith(color: AppColors.grey0),
          ),
        ],
      ),
    );
  }
}
