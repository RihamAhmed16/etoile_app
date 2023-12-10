import 'package:etoile_app/bussines_logic/login_cubit/log_in_cubit.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/presentation/screens/homeScreen.dart';
import 'package:etoile_app/presentation/screens/login%20screen.dart';
import 'package:etoile_app/presentation/screens/map_screen.dart';
import 'package:etoile_app/presentation/screens/otp_screen.dart';
import 'package:etoile_app/presentation/screens/signup%20screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bussines_logic/signup_cubit/auth_cubit.dart';

class AppRouter {
  SignUpCubit? authCubit;

  AppRouter() {
    authCubit = SignUpCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => LogInCubit(),
            child: const Login(),
          ),
        );
      case AppStrings.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignUpCubit>.value(
            value: authCubit!,
            child: const Signup(),
          ),
        );
      case AppStrings.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case AppStrings.MapScreen:
        return MaterialPageRoute(
          builder: (_) => MapScreen(),
        );
      case AppStrings.otpScreen:
        final phoneNumber = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignUpCubit>.value(
            value: authCubit!,
            child: OtpScreen(phoneNumber: phoneNumber,),
          ),
        );
    }
    return null;
  }
}
