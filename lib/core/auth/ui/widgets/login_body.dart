import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../extensions/context_extensions.dart';
import '../../../themes/app_text_styles.dart';

import '../../../utils/spacing.dart';
import 'log_in_header.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(final BuildContext context) {
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
            children: <Widget>[
              verticalSpacing(80),
              const LogInHeader(),
              verticalSpacing(60),
              const LoginForm(),
              verticalSpacing(60),
              Text(
                "login.text_account_missing".tr(),
                textAlign: TextAlign.center,
                style: AppTextStyles.font14Regular.copyWith(
                  color: context.customColors.textPrimary.withAlpha(128),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
