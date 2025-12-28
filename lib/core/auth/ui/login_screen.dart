import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/utils/functions/navigate_to_role_home.dart';

import '../../themes/app_text_styles.dart';
import '../../utils/spacing.dart';
import '../../widgets/app_dialog/app_dialogs.dart';
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
          listener: (final context, final state) {
            if (state is AuthSuccess) {
              navigateToRoleHome(context, state.userModel.role);
            } else if (state is AuthError) {
              AppDialogs.showError(
                context: context,
                title: 'login.title_login_failed'.tr(),
                message: state.errorMessage,
              );
            }
          },
          builder: (final context, final state) {
            final bool isLoading = state is AuthLoading;

            return Stack(
              children: [
                const _LoginContent(),

                if (isLoading)
                  Container(
                    color: context.customColors.background.withValues(
                      alpha: 0.4,
                    ),
                    child: Center(
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(responsiveRadius(32)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircularProgressIndicator(),
                              verticalSpacing(16),
                              Text(
                                'login.logging_in'.tr(),
                                style: AppTextStyles.font18Bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LoginContent extends StatelessWidget {
  const _LoginContent();

  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (final context, final constraints) {
        return SingleChildScrollView(
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
