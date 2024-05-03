import 'dart:async';

import 'package:flutter/cupertino.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.of(context).pushReplacementNamed("/login");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'images/background.jpg',
            fit: BoxFit.cover,
          ),
        ),
        // الصورة الثانية
        Positioned.fill(
          child: Image.asset(
            'images/luanch.png',
            //fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
