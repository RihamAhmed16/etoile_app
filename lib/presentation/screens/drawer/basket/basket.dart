import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/presentation/screens/drawer/basket/widgets/basket_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constance/colors.dart';
import '../../../widgets/custom_button.dart';


class MyBasket extends StatefulWidget {
  const MyBasket({super.key});

  @override
  State<MyBasket> createState() => _MyBasketState();
}

class _MyBasketState extends State<MyBasket> {
  @override
  void initState() {
    context.read<StoreCubit>().getBasketProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 250, 250, 250),
          bottomNavigationBar: Container(
            // padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 2.7,
                    offset: Offset(.9, 2),
                    blurStyle: BlurStyle.normal),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 7.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Item(s) Price :'),
                      Text('2015 EGP'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total :'),
                      Text('2015 EGP'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomButton(
                    text: 'Checkout',
                    width: double.infinity,
                    buttonColor: AppColors.buttonColor),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text(
              'My Basket',
              style: TextStyle(color: Colors.black87),
            ),
          ),
          body: SafeArea(
            child: state is GetBasketsLoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : BlocProvider.of<StoreCubit>(context).basketProducts.isEmpty
                    ? const Center(
                        child: Text('You don\'t have added any product yet'),
                      )
                    : ListView.builder(
                        itemCount: BlocProvider.of<StoreCubit>(context)
                            .basketProducts
                            .length,
                        itemBuilder: (context, index) {
                          return BasketItem(
                            cartModel: BlocProvider.of<StoreCubit>(context)
                                .basketProducts[index],
                          );
                        },
                      ),
          ),
        );
      },
    );
  }
}