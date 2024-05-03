import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(

      color: Colors.green,
child:Column(
  children: [

    Image.asset("images/onboard1.jpg"),

  ],


),
    );
  }
}
