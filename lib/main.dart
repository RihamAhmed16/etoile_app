import 'package:bloc/bloc.dart';
import 'package:etoile_app/app_router.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/helper/cach_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'bloc_observable.dart';
import 'firebase_options.dart';

late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      initialRoute = AppStrings.loginScreen;
    } else {
      if (CashHelper.getData(key: 'lat') == null &&
          CashHelper.getData(key: 'lng') == null) {
        initialRoute = AppStrings.MapScreen;
      } else {
        initialRoute = AppStrings.homeScreen;
      }
    }
  });
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
      )),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
