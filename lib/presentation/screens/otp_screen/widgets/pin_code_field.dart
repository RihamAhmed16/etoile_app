import 'package:etoile_app/constance/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../bussines_logic/auth_cubit/auth_cubit.dart';

class PinCode extends StatefulWidget {
  const PinCode({super.key});

  @override
  State<PinCode> createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: false,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: AppColors.blue,
        activeFillColor: AppColors.lightBlue,
        inactiveColor: AppColors.blue,
        selectedColor: AppColors.blue,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (v) {
        AuthCubit.get(context).otp = v;
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
    );
  }
}
