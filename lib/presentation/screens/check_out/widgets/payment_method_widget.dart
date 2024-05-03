import 'package:etoile_app/bussines_logic/checkout_cubit/check_out_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({super.key});

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile<PaymentMethod>(
              value: PaymentMethod.cashOnDelivery,
              activeColor: AppColors.buttonColor,
              groupValue: context.read<CheckOutCubit>().selectedPayment,
              onChanged: (value) {
                setState(() {
                  context.read<CheckOutCubit>().selectedPayment = value!;

                });
              },
              title: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      'assets/images/cash.png',
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                  const Expanded(
                      flex: 6,
                      child: Text('Cash On Delivery (COD)')),
                ],
              ),
            ),
            RadioListTile<PaymentMethod>(
              value: PaymentMethod.creditCard,
              activeColor: AppColors.buttonColor,
              groupValue:context.read<CheckOutCubit>().selectedPayment,
              onChanged: (value) {
                setState(() {
                  context.read<CheckOutCubit>().selectedPayment = value!;
                  print(value);
                });
              },
              title: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      'assets/images/credit.png',
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                  const Expanded(
                      flex: 6,
                      child: Text(
                        'Credit Card (VISA)',
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
