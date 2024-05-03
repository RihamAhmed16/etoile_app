import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/data/models/order_model.dart';
import 'package:etoile_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../check_out/widgets/checkout_product_item.dart';
import 'address_details_card_widget.dart';
import 'order_details_card_widget.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.orderModel});

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: TextStyle(
              color: AppColors.lightBlack, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OderDetailsCardWidget(orderModel: orderModel),
            Padding(
              padding:
                  EdgeInsets.only(top: 10.h, bottom: 0, right: 7.w, left: 7.w),
              child: Text(
                '${orderModel.basketItems.length} Item(s)',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            CheckOutProductsListView(products: orderModel.basketItems),
            AddressDetailsCardWidget(addressModel: orderModel.address),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: CustomButton(
                text: 'Add Feedback',
                width: double.infinity,
                buttonColor: AppColors.buttonColor,
                verticalPadding: 8.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


