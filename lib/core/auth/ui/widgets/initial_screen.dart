import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/utils/functions/navigate_to_role_home.dart';
import 'package:zrc/core/widgets/app_dialog/app_dialogs.dart';

import '../../../router/routes.dart';
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
          AppDialogs.showError(
            context: context,
            title: 'login.title_login_failed'.tr(),
            message: state.errorMessage,
          );
          context.pushReplacementNamed(Routes.loginScreen);
        } else if (state is AuthInitial) {
          context.pushReplacementNamed(Routes.onBoardingScreen);
        }
      },
      builder: (final BuildContext context, final AuthState state) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: context.customColors.onContainerPrimary,
            ),
          ),
        );
      },
    );
  }
}
