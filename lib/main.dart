import 'package:etoile_app/screens/home.dart';
import 'package:etoile_app/screens/introduction_screen.dart';
import 'package:etoile_app/screens/signup%20screen.dart';
import 'package:etoile_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
int? isviewed;
void main()async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",

      routes: {
        "/": (context) => Welcome(),
        "/login": (context) => MyApp(),
        "/signup": (context) => Signup(),
       // "/list": (context) => MyList(),
      // "/todo": (context) =>To(),

      },
        home: BlocProvider(
        create: (context) => SearchCubit(),
    child: Home(),
        )
    );

  }
}




