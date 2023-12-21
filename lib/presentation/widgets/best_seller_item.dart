import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/data/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bestSellerModel});

final HomeModel bestSellerModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 0.5,
                spreadRadius: 0.5,
                offset: Offset(0, 0.5),
                blurStyle: BlurStyle.normal),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(),
              child: Image.network(bestSellerModel.image??''),
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
                 Expanded(child: Text(bestSellerModel.name??'')),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child:  Text(
              '${bestSellerModel.price ??''} EGP',
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
