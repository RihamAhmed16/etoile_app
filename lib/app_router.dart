import 'package:etoile_app/bussines_logic/login_cubit/log_in_cubit.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/data/models/category_model.dart';
import 'package:etoile_app/data/models/user_model.dart';
import 'package:etoile_app/presentation/screens/category_screen/categories_screen.dart';
import 'package:etoile_app/presentation/screens/drawer/basket/basket.dart';
import 'package:etoile_app/presentation/screens/home_screen/home.dart';
import 'package:etoile_app/presentation/screens/introduction_screen.dart';
import 'package:etoile_app/presentation/screens/sign_in_screen/login%20screen.dart';
import 'package:etoile_app/presentation/screens/map_screen.dart';
import 'package:etoile_app/presentation/screens/otp_screen/otp_screen.dart';
import 'package:etoile_app/presentation/screens/product_details_screen/product_details_screen.dart';
import 'package:etoile_app/presentation/screens/sing_up_screen/signup%20screen.dart';
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
      case AppStrings.categoriesScreen:
        return MaterialPageRoute(
          builder: (_) => CategoriesScreen(
            categoryModel: settings.arguments as CategoryModel,
          ),
        );
      case AppStrings.productDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(
            productId: settings.arguments as String,
          ),
        );
      case AppStrings.myBasket:
        return MaterialPageRoute(
          builder: (_) => const MyBasket(),
        );
      case AppStrings.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardScreen(),
        );
      case AppStrings.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignUpCubit>.value(
            value: authCubit!,
            child: const Signup(),
          ),
        );
      case AppStrings.homeScreen:
        return MaterialPageRoute(builder: (_) => const Home());
      case AppStrings.MapScreen:
        return MaterialPageRoute(
          builder: (_) => MapScreen(),
        );
      case AppStrings.otpScreen:
        final userModel = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignUpCubit>.value(
            value: authCubit!,
            child: OtpScreen(
            userModel:userModel ,
            ),
          ),
        );
    }
    return null;
  }
}
