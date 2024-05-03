import 'package:etoile_app/bussines_logic/settings_cubit/settings_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/core/helper/methods/show_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountListenerWidget extends StatelessWidget {
  const DeleteAccountListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is DeleteUserAccountSuccess) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.loginScreen, (route) => false);
        }
        if (state is DeleteUserAccountLoading) {
          showProgressIndicator(context);
        }
        if (state is DeleteUserAccountFailure) {
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
