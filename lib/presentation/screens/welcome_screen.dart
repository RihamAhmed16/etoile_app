import 'dart:async';

import 'package:flutter/cupertino.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
   initState(){
startTimer();
    super.initState();

  }

  startTimer(){
    var duration= Duration(seconds:2);
    return Timer(duration,route);
  }
  route(){
    Navigator.of(context).pushReplacementNamed("/login");
  }
  Widget build(BuildContext context) {
    return  Container(

      child: Image.asset("images/luanch.png",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,),


    );
  }
}
