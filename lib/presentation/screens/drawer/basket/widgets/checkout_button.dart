import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../bussines_logic/home_cubit/home_cubit.dart';
import '../../../../../constance/colors.dart';
import '../../../../../constance/strings.dart';
import '../../../../../core/helper/methods/toast_message.dart';
import '../../../../widgets/custom_button.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<StoreCubit>();
    return BlocBuilder<StoreCubit,StoreState>(
      builder: (context, state) {
        return Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Item(s) Price :'),
                    Text('${cubit.totalPrice}'),
                  ],
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total :'),
                    Text('${cubit.totalPrice} EGP'),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomButton(
                  text: 'Checkout',
                  onPressed: () {
                    if (cubit.basketProducts.isEmpty) {
                      showToast(
                          text: 'You Basket is Empty 😅 Add some Products 🥰',
                          state: Toaststate.SUCCESS);
                    } else {
                      if (cubit.address.isEmpty == false) {
                        Navigator.pushNamed(context, Routes.checkOut);
                      } else {
                        Navigator.pushNamed(context, Routes.address);
                      }
                    }
                  },
                  width: double.infinity,
                  buttonColor: AppColors.buttonColor),
            ],
          ),
        );
      },
    );
  }
}
