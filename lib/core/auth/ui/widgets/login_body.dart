import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/auth/ui/widgets/log_in_header.dart';
import 'package:zrc/core/auth/ui/widgets/login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 50.h),
        const LogInHeader(),
        SizedBox(height: 60.h),
        const LoginForm(),
      ],
    );
  }
}
