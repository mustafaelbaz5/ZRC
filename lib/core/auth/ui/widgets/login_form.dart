import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../themes/app_colors.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthCubit>().state is AuthLoading;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email
            Text(
              'login.email_label'.tr(),
              style: AppTextStyles.font16BlackBold(),
            ),
            verticalSpacing(8),
            CustomTextFormField(
              controller: _emailController,
              hintText: 'login.email_hint'.tr(),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
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
            Text(
              'login.password_label'.tr(),
              style: AppTextStyles.font16BlackBold().copyWith(fontSize: 16.sp),
            ),
            verticalSpacing(8),
            CustomTextFormField(
              controller: _passwordController,
              hintText: 'login.password_hint'.tr(),
              isObscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'login.password_error_empty'.tr();
                }
                return null;
              },
            ),

            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'login.forgot_password'.tr(),
                  style: AppTextStyles.font16BlackRegular().copyWith(
                    color: AppColors.lightBlue,
                  ),
                ),
              ),
            ),
            verticalSpacing(24),

            // Login button
            CustomTextButton(
              buttonText: 'login.button_login'.tr(),
              onPressed: isLoading ? null : _onLoginPressed,
              isLoading: isLoading,
              buttonHeight: 56.h,
              buttonWidth: double.infinity,
              borderRadius: 12.r,
            ),
          ],
        ),
      ),
    );
  }
}
