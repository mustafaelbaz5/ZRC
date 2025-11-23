import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zrc/core/auth/ui/widgets/login_body.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/utils/functions/navigate_to_role_home.dart';
import '../logic/cubit/auth_cubit.dart';
import '../../widgets/show_error_dialog.dart';
import 'widgets/background_shapes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          navigateToRoleHome(context, state.role);
        } else if (state is AuthError) {
          showErrorDialog(
            context: context,
            title: 'Login Failed',
            message: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: AppColors.darkBlue),
            ),
          );
        }
        return const Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                BackgroundShapes(),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: LoginBody(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
