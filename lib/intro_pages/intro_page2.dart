import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(

      color: Colors.green,
      child:Column(
        children: [

          Image.asset("images/onboard2.png"),

        ],


      ),

    );
  }
}