import 'package:flutter/material.dart';
import 'package:zrc/core/auth/ui/widgets/log_in_header.dart';
import 'package:zrc/core/auth/ui/widgets/login_form.dart';
import 'package:zrc/core/utils/spacing.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.zero,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpacing(80),
              const LogInHeader(),
              verticalSpacing(60),
              const LoginForm(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
