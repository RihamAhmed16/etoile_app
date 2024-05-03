import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/constance/assets_manager.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/core/DI/dependency_injecion.dart';
import 'package:etoile_app/presentation/screens/drawer/basket/widgets/basket_screen_list_view.dart';
import 'package:etoile_app/presentation/screens/drawer/basket/widgets/checkout_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helper/methods/show_progress_indicator.dart';
import '../../../../core/widgets/not_authorized_widget.dart';

class MyBasket extends StatefulWidget {
  const MyBasket({super.key});

  @override
  State<MyBasket> createState() => _MyBasketState();
}

class _MyBasketState extends State<MyBasket> {
  @override
  void initState() {
    Future.wait([
      context.read<StoreCubit>().getBasketProducts(),
      context.read<StoreCubit>().getAllAddresses(),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<StoreCubit>();
    return BlocConsumer<StoreCubit, StoreState>(
      listener: (context, state) {
        if (state is RemoveFromBasketSuccess) {
          cubit.getBasketProducts();
        }
        if (state is UpdateQuantityLoading) {
          showProgressIndicator(context);
        }
        if (state is UpdateQuantitySuccess) {
          Navigator.pop(context);
          cubit.getBasketProducts();
        }
      },
      builder: (context, state) {
        if (state is GetBasketSuccessState ||
            serviceLocator.get<FirebaseAuth>().currentUser != null) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 250, 250, 250),
            bottomNavigationBar: const CheckoutButton(),
            appBar: AppBar(
              title: const Text(
                'My Basket',
                style: TextStyle(color: Colors.black87),
              ),
            ),
            body: SafeArea(
              child: cubit.basketProducts.isEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AssetsManager.emptyCart,
                            height: 300.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Center(
                            child:
                                Text('You don\'t have added any product yet'),
                          ),
                        ],
                      ),
                    )
                  : const BasketScreenViewBody(),
            ),
          );
        } else if (state is GetBasketFailureState) {
          return Center(
            child: Text(state.error),
          );
        } else if (serviceLocator.get<FirebaseAuth>().currentUser == null) {
          return const NotAuthorizedWidget(
            text: 'Basket',
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.buttonColor,
            ),
          );
        }
      },
    );
  }
}
