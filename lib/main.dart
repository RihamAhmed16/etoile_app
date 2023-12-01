import 'package:etoile_app/screens/login%20screen.dart';
import 'package:etoile_app/screens/signup%20screen.dart';
import 'package:etoile_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",

      routes: {
        "/": (context) => Welcome(),
        "/login": (context) => Login(),
        "/signup": (context) => Signup(),
       // "/list": (context) => MyList(),
      // "/todo": (context) =>To(),

      },


    );
  }
}




