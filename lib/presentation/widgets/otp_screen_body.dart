import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/presentation/widgets/pin_code_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bussines_logic/signup_cubit/auth_cubit.dart';
import '../../helper/methods/show_progress_indicator.dart';
import 'build_otp_verfied.dart';
import 'build_text_otp_screen.dart';

class OtpScreenBody extends StatelessWidget {
  const OtpScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88,),
      child: Column(
        children: [
          BuildIntroText(),
          const SizedBox(
            height: 88,
          ),
          PinCode(),
          const SizedBox(
            height: 60,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                showProgressIndicator(context);
                login(context);
              },
              child: Text(
                'Verify',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(110, 50),
                  backgroundColor: AppColors.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),),
            ),
          ),
          BuildCodeVerificationBloc(),
        ],
      ),
    );
  }

  void login(BuildContext context) {
    String otp = BlocProvider.of<SignUpCubit>(context).otp!;
    BlocProvider.of<SignUpCubit>(context).submitOtp(otp);
  }
}
