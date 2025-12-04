import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/navigation.dart';
import 'package:zrc/core/router/routes.dart';
import 'package:zrc/core/storage/user_storage.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/widgets/custom_text_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text(
          'Logout',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: TextStyle(fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel', style: TextStyle(fontSize: 14.sp)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text('Logout', style: TextStyle(fontSize: 14.sp)),
          ),
        ],
      ),
    );

    if (shouldLogout == true && context.mounted) {
      try {
        // Clear user data from secure storage
        final userStorage = UserStorage();
        await userStorage.clearUser();

        if (context.mounted) {
          context.pushNamedAndRemoveUntil(Routes.onBoardingScreen);
        }
      } catch (e) {
        debugPrint('Error during logout: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      buttonWidth: 300,
      buttonHeight: 50,
      backgroundColor: Colors.red,
      buttonText: "LogOut",
      textStyle: AppTextStyles.font18WhiteRegular(),
      onPressed: () => _handleLogout(context),
    );
  }
}
