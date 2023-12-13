
import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:etoile_app/app_router.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/helper/cach_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc_observable.dart';
import 'firebase_options.dart';

late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  bool? onBoarding = CashHelper.getData(key: "onBoarding");
  if (onBoarding != null) {
    initialRoute = AppStrings.homeScreen;
  } else {
    initialRoute = AppStrings.onBoardingScreen;
  }
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(
      appRouter: AppRouter(),
    ),
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
            useMaterial3: false,
            appBarTheme: const AppBarTheme(
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
      ),
    );
  }
}
