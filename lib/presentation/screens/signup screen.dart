import 'package:flutter/material.dart';

import '../widgets/signup_body_view.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SignupBodyView(),
    );
  }
}
