import 'package:device_preview/device_preview.dart';
import 'package:etoile_app/app_router.dart';
import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/data/repository/store_repo.dart';
import 'package:etoile_app/helper/cach_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc_observable.dart';
import 'constance/test_list.dart';
import 'firebase_options.dart';

late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await updateProductCategoryIds();
  bool? onBoarding = CashHelper.getData(key: "onBoarding");
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      initialRoute = AppStrings.loginScreen;
    } else {
      if (onBoarding == true) {
        initialRoute = AppStrings.homeScreen;
      } else {
        initialRoute = AppStrings.onBoardingScreen;
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => StoreCubit(StoreRepo()),
        child: MaterialApp(
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
      ),
    );
  }
}
