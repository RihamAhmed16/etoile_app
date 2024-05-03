import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etoile_app/bussines_logic/auth_cubit/auth_cubit.dart';
import 'package:etoile_app/bussines_logic/checkout_cubit/check_out_cubit.dart';
import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/bussines_logic/orders_cubit/orders_cubit.dart';
import 'package:etoile_app/bussines_logic/settings_cubit/settings_cubit.dart';
import 'package:etoile_app/data/address_api_call.dart';
import 'package:etoile_app/data/orders_api_call.dart';
import 'package:etoile_app/data/repository/address_repo.dart';
import 'package:etoile_app/data/repository/orders_repo.dart';
import 'package:etoile_app/data/repository/store_repo.dart';
import 'package:etoile_app/data/repository/user_repo.dart';
import 'package:etoile_app/data/store_api_call.dart';
import 'package:etoile_app/data/user_api_call.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> setUpGetIt() async {
  serviceLocator.registerFactory<StoreCubit>(
    () => StoreCubit(
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  serviceLocator.registerLazySingleton<OrdersApiCall>(
    () => OrdersApiCall(),
  );
  serviceLocator.registerLazySingleton<OrdersRepo>(
    () => OrdersRepo(
      ordersApiCall: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<OrdersCubit>(
    () => OrdersCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  serviceLocator.registerLazySingleton<AddressApiCall>(
    () => AddressApiCall(),
  );
  serviceLocator.registerLazySingleton<AddressRepo>(
    () => AddressRepo(
      addressApiCall: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<AuthCubit>(
    () => AuthCubit(),
  );
  serviceLocator.registerLazySingleton<ApiCall>(
    () => ApiCall(),
  );
  serviceLocator.registerLazySingleton<CheckOutCubit>(
    () => CheckOutCubit(
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<StoreRepo>(
    () => StoreRepo(),
  );
  serviceLocator.registerLazySingleton<SettingsCubit>(
    () => SettingsCubit(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<UserApiCall>(
    () => UserApiCall(),
  );
  serviceLocator.registerLazySingleton<UserRepo>(
    () => UserRepo(
      userApiCall: serviceLocator(),
      apiCall: serviceLocator(),
    ),
  );
}
