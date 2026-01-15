import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/context_extensions.dart';
import '../../../router/routes.dart';
import '../../../utils/functions/navigate_to_role_home.dart';
import '../../logic/cubit/auth_cubit.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (final context, final state) {
        if (state is AuthSuccess) {
          navigateToRoleHome(context, state.userModel.role);
        } else {
          context.pushNamedAndRemoveAll(Routes.onBoardingScreen);
        }
      },
      builder: (final context, final state) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: context.customColors.textPrimary,
            ),
          ),
        );
      },
    );
  }
}
