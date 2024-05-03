import 'package:etoile_app/data/models/user_model.dart';
import 'package:flutter/material.dart';

import 'widgets/otp_screen_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.userModel});
final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body: OtpScreenBody( userModel: userModel,
          ),
        ),
    );
  }
}
