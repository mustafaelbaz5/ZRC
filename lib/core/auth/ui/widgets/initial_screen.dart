import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrc/core/auth/logic/cubit/auth_cubit.dart';
import 'package:zrc/core/router/routes.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/utils/functions/navigate_to_role_home.dart';
import 'package:zrc/core/widgets/show_error_dialog.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          navigateToRoleHome(context, state.role);
        } else if (state is AuthError) {
          showErrorDialog(
            context: context,
            title: 'Login Error',
            message: state.errorMessage,
          );
          //  LoginScreen
          Navigator.pushReplacementNamed(context, Routes.loginScreen);
        } else if (state is AuthInitial) {
          //  → OnBoarding
          Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(color: AppColors.darkBlue),
          ),
        );
      },
    );
  }
}
