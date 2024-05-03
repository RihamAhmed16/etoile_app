import 'package:flutter/material.dart';

import 'signup_body_view.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SignupBodyView(),
    );
  }
}
