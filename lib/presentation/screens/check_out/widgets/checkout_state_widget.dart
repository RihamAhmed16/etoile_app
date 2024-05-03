import 'package:etoile_app/constance/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'check_out_divider.dart';
import 'order_state_item.dart';

class CheckOutStateWidget extends StatelessWidget {
  const CheckOutStateWidget({
    super.key,
    required this.currentView,
  });

  final int currentView;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                spreadRadius: 1.9,
                offset: Offset(.9, 2),
                blurStyle: BlurStyle.normal),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OrderStateItem(
              text: 'Delivery',
              color: AppColors.buttonColor,
            ),
            SizedBox(
              width: 5.w,
            ),
            CheckOutDivider(
              color: AppColors.buttonColor,
            ),
            SizedBox(
              width: 5.w,
            ),
            OrderStateItem(
              text: 'Payment',
              color: currentView == 1 || currentView == 2
                  ? AppColors.buttonColor
                  : Colors.grey,
            ),
            SizedBox(
              width: 5.w,
            ),
            CheckOutDivider(
              color: currentView == 2 ? AppColors.buttonColor : Colors.grey,
            ),
            SizedBox(
              width: 5.w,
            ),
            OrderStateItem(
              text: 'Summary',
              color: currentView == 2 ? AppColors.buttonColor : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
