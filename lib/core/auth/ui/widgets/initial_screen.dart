import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../router/routes.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/functions/navigate_to_role_home.dart';
import '../../../widgets/show_error_dialog.dart';
import '../../data/model/user_model.dart';
import '../../logic/cubit/auth_cubit.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (final BuildContext context, final AuthState state) {
        if (state is AuthSuccess) {
          final UserModel user = state.userModel;
          navigateToRoleHome(context, user.role);
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
      builder: (final BuildContext context, final AuthState state) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(color: AppColors.primary300),
          ),
        );
      },
    );
  }
}
