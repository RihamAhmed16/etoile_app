import 'package:flutter/material.dart';

import '../widgets/otp_screen_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);
final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: OtpScreenBody(),
        ),
    );
  }
}
