import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/spacing.dart';
import '../../widgets/app_dialog/app_dialogs.dart';

import '../../themes/app_text_styles.dart';
import '../../utils/functions/navigate_to_role_home.dart';
import '../data/model/user_model.dart';
import '../logic/cubit/auth_cubit.dart';
import 'widgets/background_shapes.dart';
import 'widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (final BuildContext context, final AuthState state) {
            if (state is AuthSuccess) {
              final UserModel user = state.userModel;
              navigateToRoleHome(context, user.role);
            } else if (state is AuthError) {
              AppDialogs.showError(
                context: context,
                title: 'login.title_login_failed'.tr(),
                message: state.errorMessage,
              );
            }
          },

          builder: (final BuildContext context, final AuthState state) {
            return Stack(
              children: <Widget>[
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder:
                      (final Widget child, final Animation<double> animation) =>
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

  Widget _buildBodyForState(final AuthState state) {
    if (state is AuthSuccess) {
      return Center(
        key: const ValueKey('success_view'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 80,
            ),
            const SizedBox(height: 16),
            Text(
              'login.title_login_success'.tr(),
              style: AppTextStyles.font20Bold,
              textAlign: TextAlign.center,
            ),
            verticalSpacing(16),
            Text(
              'login.message_login_success'.tr(),
              style: AppTextStyles.font16Regular,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    // login view
    return LayoutBuilder(
      builder: (final BuildContext context, final BoxConstraints constraints) {
        return SingleChildScrollView(
          key: const ValueKey('login_view'),
          child: SizedBox(
            height: constraints.maxHeight,
            width: double.infinity,
            child: const Stack(
              children: <Widget>[BackgroundShapes(), LoginBody()],
            ),
          ),
        );
      },
    );
  }
}
