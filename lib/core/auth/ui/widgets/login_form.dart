import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/auth/logic/cubit/auth_cubit.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/regex.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/custom_text_button.dart';
import 'package:zrc/core/widgets/custom_text_form_.dart';

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

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Email
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Email',
              style: AppTextStyles.font16BlackBold.copyWith(fontSize: 16.sp),
            ),
          ),
          verticalSpacing(8),
          CustomTextFormField(
            controller: _emailController,
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email cannot be empty';
              } else if (!AppRegex.isEmailValid(value.trim())) {
                return 'Please enter a valid email[********@.znu.edu.eg]';
              }
              return null;
            },
          ),
          verticalSpacing(24),

          // Password
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password',
              style: AppTextStyles.font16BlackBold.copyWith(fontSize: 16.sp),
            ),
          ),
          verticalSpacing(8),
          CustomTextFormField(
            controller: _passwordController,
            hintText: 'Enter your password',
            isObscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password cannot be empty';
              }
              return null;
            },
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: AppTextStyles.font16BlackRegular.copyWith(
                  color: AppColors.lightBlue,
                ),
              ),
            ),
          ),
          verticalSpacing(24),

          // Login button
          CustomTextButton(
            buttonText: 'Login',
            onPressed: isLoading ? null : _onLoginPressed,
            isLoading: isLoading,
            buttonHeight: 56.h,
            buttonWidth: double.infinity,
            borderRadius: 12.r,
          ),
        ],
      ),
    );
  }
}
