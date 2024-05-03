import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:etoile_app/app_router.dart';
import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/bussines_logic/settings_cubit/settings_cubit.dart';
import 'package:etoile_app/constance/app_styles.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/helper/cach_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc_observable.dart';
import 'constance/test_list.dart';
import 'core/DI/dependency_injecion.dart';
import 'firebase_options.dart';
import 'offline_widget.dart';

late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await CashHelper.init();
  await setUpGetIt();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  await updateProductCategoryIds();
  bool? onBoarding = CashHelper.getData(key: "onBoarding");
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (onBoarding == true) {
      initialRoute = Routes.homeScreen;
    } else {
      initialRoute = Routes.onBoardingScreen;
    }
  });
  runApp(
    EasyLocalization(
      saveLocale: true,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translation',
      fallbackLocale: const Locale('en'),
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (!connected) {
          return const OfflineWidget();
        }
        return child;
      },
      child: EtoileApp(
        appRouter: appRouter,
      ),
    );
  }
}

class EtoileApp extends StatelessWidget {
  const EtoileApp({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator.get<StoreCubit>(),
        ),
        BlocProvider.value(
          value: serviceLocator.get<SettingsCubit>(),
        ),
      ],
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is LanguageLoaded) {

          }
        },
        builder: (context, state) {
          Locale? locale;
          if (state is LanguageLoaded) {
            locale = state.locale;
          }
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: locale ?? context.locale,
            key: ValueKey(locale ?? context.locale),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
              useMaterial3: false,
              fontFamily: AppStyles.almaraiFontFamily,
              scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250),
              appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(color: Colors.black, fontSize: 18.sp),
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark),
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
                elevation: 0.0,
              ),
            ),
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            initialRoute: initialRoute,
            onGenerateRoute: appRouter.generateRoute,
          );
        },
      ),
    );
  }
}
