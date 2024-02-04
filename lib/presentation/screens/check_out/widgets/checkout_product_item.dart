import 'package:auto_size_text/auto_size_text.dart';
import 'package:etoile_app/data/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:badges/badges.dart' as badges;

class CheckOutProductsListView extends StatelessWidget {
  const CheckOutProductsListView({
    super.key, required this.products,
  });
final List<CartModel> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final cartModel = products[index];
          return CheckoutProductItem(cartModel: cartModel);
        },
      ),
    );
  }
}

class CheckoutProductItem extends StatelessWidget {
  const CheckoutProductItem({
    super.key,
    required this.cartModel,
  });

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 2.w),
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -10, end: -1),
        showBadge: true,
        ignorePointer: false,
        badgeContent: Text(
          'x${cartModel.quantity.toString()}',
          style: TextStyle(
            color: Colors.black,
            fontSize: cartModel.quantity.toString().length == 1
                ? 14.sp
                : cartModel.quantity.toString().length == 2
                    ? 12.sp
                    : 10.sp,
          ),
        ),
        badgeStyle: badges.BadgeStyle(
            badgeColor: Colors.transparent,
            padding: EdgeInsets.all(
              cartModel.quantity.toString().length == 1
                  ? 5.h
                  : cartModel.quantity.toString().length == 2
                      ? 7.h
                      : 10.h,
            ),
            borderSide: const BorderSide(
              color: Colors.black,
            )),
        badgeAnimation: const badges.BadgeAnimation.rotation(
          animationDuration: Duration(seconds: 1),
          colorChangeAnimationDuration: Duration(seconds: 1),
          loopAnimation: false,
          curve: Curves.fastOutSlowIn,
          colorChangeAnimationCurve: Curves.easeInCubic,
        ),
        child: SizedBox(
          width: 180.w,
          child: Card(
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: Image.network(
                      cartModel.image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0.w),
                    child: Text(
                      cartModel.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0.w),
                    child: Text(
                      '${cartModel.price} EGP',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.only(left: 8.0.w, top: 15.h),
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 150.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(4),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                    spreadRadius: 1.9,
                    offset: Offset(1.7, .4),
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Image.asset('assets/images/test1.png'),
                  ),
                ),
                const Text(
                  'Gateaux',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Text(
                  '${99} EGP',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            top: -20,
            right: -10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Center(
                child: AutoSizeText(
                  overflow: TextOverflow.ellipsis,
                  'x${5}',
                  style: TextStyle(fontSize: 12.sp),
                  minFontSize: 8.sp,
                  // set a minimum font size
                  maxFontSize: 12.sp,
                  //
                  stepGranularity: 1.sp,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
