import 'package:etoile_app/bussines_logic/checkout_cubit/check_out_cubit.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/methods/show_progress_indicator.dart';

class AddressBlocListenerWidget extends StatelessWidget {
  const AddressBlocListenerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckOutCubit, CheckOutState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is AddAddressLoading) {
          return showProgressIndicator(context);
        }
        if (state is AddAddressSuccess) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Routes.checkOut);
        }
        if (state is AddAddressFailure) {
          String errorMessage = state.error;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.redAccent,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
