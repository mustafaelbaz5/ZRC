import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../themes/app_text_styles.dart';
import '../../utils/functions/navigate_to_role_home.dart';
import '../../widgets/show_error_dialog.dart';
import '../logic/cubit/auth_cubit.dart';
import 'widgets/background_shapes.dart';
import 'widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              final user = state.userModel;
              navigateToRoleHome(context, user.role);
            } else if (state is AuthError) {
              showErrorDialog(
                context: context,
                title: 'Login Failed',
                message: state.errorMessage,
              );
            }
          },

          builder: (context, state) {
            return Stack(
              children: [
                /// MAIN CONTENT
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: _buildBodyForState(state),
                ),
                
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBodyForState(AuthState state) {
    if (state is AuthSuccess) {
      return Center(
        key: const ValueKey('success_view'),
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: Text(
              'Welcome, ${state.userModel.name}',
              style: AppTextStyles.font20BlackBold,
            ),
          ),
        ),
      );
    }

    // DEFAULT: Login Screen
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          key: const ValueKey('login_view'),

          child: SizedBox(
            height: constraints.maxHeight,
            width: double.infinity,
            child: const Stack(children: [BackgroundShapes(), LoginBody()]),
          ),
        );
      },
    );
  }
}
