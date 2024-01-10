import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bestSellerModel});

final Products bestSellerModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                spreadRadius: 0.9,
                offset: Offset(2, 2),
                blurStyle: BlurStyle.normal),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, AppStrings.productDetailsScreen,arguments: bestSellerModel.productId);
              },
              child: Container(
                decoration: const BoxDecoration(),
                child: Image.network(bestSellerModel.image),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.buttonColor,
                  foregroundColor: AppColors.buttonColor,
                  radius: 9,
                  child: const Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                 Expanded(child: Text(bestSellerModel.name)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child:  Text(
              '${bestSellerModel.price} EGP',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
