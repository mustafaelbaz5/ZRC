import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../themes/app_text_styles.dart';
import '../../../utils/regex.dart';
import '../../../utils/spacing.dart';
import '../../../widgets/custom_text_button.dart';
import '../../../widgets/custom_text_form_.dart';
import '../../logic/cubit/auth_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(final BuildContext context) {
    final bool isLoading = context.watch<AuthCubit>().state is AuthLoading;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Email
            Text('login.email_label'.tr(), style: AppTextStyles.font16Bold),
            verticalSpacing(8),
            CustomTextFormField(
              controller: _emailController,
              hintText: 'login.email_hint'.tr(),
              keyboardType: TextInputType.emailAddress,
              validator: (final String? value) {
                if (value == null || value.isEmpty) {
                  return 'login.email_error_empty'.tr();
                } else if (!AppRegex.isEmailValid(value.trim())) {
                  return 'login.email_error_invalid'.tr();
                }
                return null;
              },
            ),
            verticalSpacing(24),

            // Password
            Text('login.password_label'.tr(), style: AppTextStyles.font16Bold),
            verticalSpacing(8),
            CustomTextFormField(
              controller: _passwordController,
              hintText: 'login.password_hint'.tr(),
              isObscureText: true,
              validator: (final String? value) {
                if (value == null || value.isEmpty) {
                  return 'login.password_error_empty'.tr();
                }
                return null;
              },
            ),

            verticalSpacing(40),

            // Login button
            CustomTextButton(
              textStyle: AppTextStyles.font20Bold,
              buttonText: 'login.button_login'.tr(),
              onPressed: isLoading ? null : _onLoginPressed,
              isLoading: isLoading,
              buttonHeight: responsiveHeight(56),
              buttonWidth: double.infinity,
              borderRadius: 12.r,
            ),
          ],
        ),
      ),
    );
  }
}
