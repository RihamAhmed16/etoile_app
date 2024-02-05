import 'package:etoile_app/bussines_logic/checkout_cubit/check_out_cubit.dart';
import 'package:etoile_app/bussines_logic/orders_cubit/orders_cubit.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/core/DI/dependency_injecion.dart';
import 'package:etoile_app/data/models/address_model.dart';
import 'package:etoile_app/data/models/category_model.dart';
import 'package:etoile_app/data/models/order_model.dart';
import 'package:etoile_app/data/models/user_model.dart';
import 'package:etoile_app/presentation/screens/address_screen/address_screen.dart';
import 'package:etoile_app/presentation/screens/address_screen/widgets/edit_address_screen.dart';
import 'package:etoile_app/presentation/screens/category_screen/categories_screen.dart';
import 'package:etoile_app/presentation/screens/check_out/check_out_view.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/credit_card_view.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/success_order_screen.dart';
import 'package:etoile_app/presentation/screens/drawer/about_us/about_us.dart';
import 'package:etoile_app/presentation/screens/drawer/addresses/addresses.dart';
import 'package:etoile_app/presentation/screens/drawer/basket/basket.dart';
import 'package:etoile_app/presentation/screens/drawer/branches/branches.dart';
import 'package:etoile_app/presentation/screens/drawer/categories/Categories.dart';
import 'package:etoile_app/presentation/screens/drawer/contactus/contactus.dart';
import 'package:etoile_app/presentation/screens/drawer/delivery/delivery.dart';
import 'package:etoile_app/presentation/screens/drawer/language/language.dart';
import 'package:etoile_app/presentation/screens/drawer/order/order.dart';
import 'package:etoile_app/presentation/screens/drawer/order/widgets/order_details.dart';
import 'package:etoile_app/presentation/screens/drawer/policy/policy.dart';
import 'package:etoile_app/presentation/screens/drawer/profile/profile.dart';
import 'package:etoile_app/presentation/screens/drawer/settings/settings.dart';
import 'package:etoile_app/presentation/screens/home_screen/home.dart';
import 'package:etoile_app/presentation/screens/introduction_screen.dart';
import 'package:etoile_app/presentation/screens/search_screen/search_screen_view.dart';
import 'package:etoile_app/presentation/screens/sign_in_screen/login%20screen.dart';
import 'package:etoile_app/presentation/screens/otp_screen/otp_screen.dart';
import 'package:etoile_app/presentation/screens/product_details_screen/product_details_screen.dart';
import 'package:etoile_app/presentation/screens/sing_up_screen/signup%20screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bussines_logic/auth_cubit/auth_cubit.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>.value(
            value: serviceLocator.get<AuthCubit>(),
            child: const Login(),
          ),
        );
      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (_) => CategoriesScreen(
            categoryModel: settings.arguments as CategoryModel,
          ),
        );
      case Routes.productDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(
            productId: settings.arguments as String,
          ),
        );
      case Routes.myBasket:
        return MaterialPageRoute(
          builder: (_) => const MyBasket(),
        );
      case Routes.successOrder:
        return MaterialPageRoute(
          builder: (_) => const SuccessOrderScreen(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardScreen(),
        );
      case Routes.orderDetails:
        return MaterialPageRoute(
          builder: (_) =>
              OrderDetails(orderModel: settings.arguments as OrderModel),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>.value(
            value: serviceLocator.get<AuthCubit>(),
            child: const Signup(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const Home());
      case Routes.aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUs());
      case Routes.myAddresses:
        return MaterialPageRoute(builder: (_) => const MyAddresses());
      case Routes.branches:
        return MaterialPageRoute(builder: (_) => const Branches());
      case Routes.drawerCategories:
        return MaterialPageRoute(builder: (_) => const DrawerCategories());
      case Routes.contactUs:
        return MaterialPageRoute(builder: (_) => const ContactUs());
      case Routes.delivery:
        return MaterialPageRoute(builder: (_) => const Delivery());
      case Routes.language:
        return MaterialPageRoute(builder: (_) => const Language());
      case Routes.creditCard:
        return MaterialPageRoute(
            builder: (_) => const PaymentDetailsViewBody());
      case Routes.searchScreen:
        return MaterialPageRoute(
            builder: (_) => const SearchScreenView());
      case Routes.orders:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<OrdersCubit>(
                create: (context) => serviceLocator.get<OrdersCubit>(),
                child: const MyOrder()));
      case Routes.policy:
        return MaterialPageRoute(builder: (_) => const Policy());
      case Routes.profile:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>.value(
            value: serviceLocator.get<AuthCubit>(),
            child: const Profile(),
          ),
        );
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const Settings());
      // case AppStrings.mapScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => MapScreen(),
      //   );
      case Routes.otpScreen:
        final userModel = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>.value(
            value: serviceLocator.get<AuthCubit>(),
            child: OtpScreen(
              userModel: userModel,
            ),
          ),
        );
      case Routes.checkOut:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CheckOutCubit>(
            create: (context) =>
                CheckOutCubit(serviceLocator(), serviceLocator()),
            child: const CheckOutView(),
          ),
        );
      case Routes.addressDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CheckOutCubit>(
            create: (context) =>
                CheckOutCubit(serviceLocator(), serviceLocator()),
            child: EditAddressScreen(
                addressModel: settings.arguments as AddressModel),
          ),
        );
      case Routes.address:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CheckOutCubit>(
            create: (context) =>
                CheckOutCubit(serviceLocator(), serviceLocator()),
            child: const AddressScreen(),
          ),
        );
    }
    return null;
  }
}
