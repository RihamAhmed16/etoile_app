import 'package:etoile_app/presentation/screens/sing_up_screen/signup_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bussines_logic/auth_cubit/auth_cubit.dart';
import '../../../../constance/strings.dart';
import '../../../../core/helper/methods/show_progress_indicator.dart';

class BuildPhoneNumberSubmitedBloc extends StatelessWidget {
  const BuildPhoneNumberSubmitedBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is LoadingAuthState) {
          return showProgressIndicator(context);
        }
        if (state is PhoneSubmittedAuthState) {
          Navigator.pop(context);
          Navigator.pushNamed(context, Routes.otpScreen,
              arguments: mobileNumberController.text);
        }
        if (state is ErrorOccurred) {
          String errorMessage = state.errorMessage;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.black,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: Container(),
    );
  }
}
