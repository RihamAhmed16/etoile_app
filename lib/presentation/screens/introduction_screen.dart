import 'package:etoile_app/intro_pages/intro_page1.dart';
import 'package:etoile_app/intro_pages/intro_page2.dart';
import 'package:etoile_app/main.dart';
import 'package:etoile_app/screens/home.dart';
import 'package:etoile_app/screens/signup%20screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class MyApp extends StatefulWidget {
  MyApp ({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp > {
  PageController _controller= PageController();

  bool onLastPage=false;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isviewed != 0 ? Signup() : Home(),
    );
  }
}


