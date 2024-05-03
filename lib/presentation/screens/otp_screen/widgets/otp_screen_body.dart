import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/data/models/user_model.dart';
import 'package:etoile_app/presentation/screens/otp_screen/widgets/pin_code_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bussines_logic/auth_cubit/auth_cubit.dart';
import 'build_otp_verfied.dart';
import 'build_text_otp_screen.dart';

class OtpScreenBody extends StatelessWidget {
  const OtpScreenBody({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 88,
      ),
      child: Column(
        children: [
          BuildIntroText(
            phoneNumber: userModel.mobileNumber!,
          ),
          const SizedBox(
            height: 88,
          ),
          const PinCode(),
          const SizedBox(
            height: 60,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () async {
                // showProgressIndicator(context);
               await login(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(110, 50),
                backgroundColor: AppColors.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'Verify',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const BuildCodeVerificationBloc(),
        ],
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    String otp = BlocProvider.of<AuthCubit>(context).otp!;
   await BlocProvider.of<AuthCubit>(context).submitOtp(otp,
        userModel: UserModel(
          firstName: userModel.firstName,
          lastName: userModel.lastName,
          emailAddress: userModel.emailAddress,
          mobileNumber: userModel.mobileNumber,
          password: userModel.password,
        ));
  }
}
