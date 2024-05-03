import 'package:etoile_app/bussines_logic/settings_cubit/settings_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/core/helper/methods/show_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordListenerWidget extends StatelessWidget {
  const ChangePasswordListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is ChangePasswordLoading) {
          showProgressIndicator(context);
        }
        if (state is ChangePasswordSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.buttonColor,
              content: const Text('Password changed successfully'),
            ),
          );
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeScreen, (route) => false);
        }
        if (state is ChangePasswordFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.buttonColor,
              content: Text(state.error),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
