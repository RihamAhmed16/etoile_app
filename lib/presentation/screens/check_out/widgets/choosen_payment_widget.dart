import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../bussines_logic/checkout_cubit/check_out_cubit.dart';
import '../../../../constance/colors.dart';

class ChoosenPaymentMethodWidget extends StatelessWidget {
  const ChoosenPaymentMethodWidget({
    super.key,
    required this.cubit,
  });

  final CheckOutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.6,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          Icons.check_box,
          color: AppColors.buttonColor,
          size: 25.sp,
        ),
        title: Text(
          cubit.selectedPayment == PaymentMethod.cashOnDelivery
              ? 'Cash On Delivery (COD)'
              : 'Credit Card (VISA)',
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
