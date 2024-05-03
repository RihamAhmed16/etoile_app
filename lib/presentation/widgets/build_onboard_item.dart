import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildOnBoardItem extends StatelessWidget {
  const BuildOnBoardItem({super.key, required this.model, required this.index});

  final OnBoardingModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(model.image),
           SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      index == 0 ? AppColors.buttonColor : AppColors.lightBlack,
                ),
              ),
               SizedBox(width: 6.w,),
              Container(
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      index == 0 ? AppColors.lightBlack : AppColors.buttonColor,
                ),
              ),
            ],
          ),
           SizedBox(height: 10.h,),
          Text(model.title,style: const TextStyle(fontWeight: FontWeight.bold,),),
          Text(model.subTitle,style: const TextStyle(fontWeight: FontWeight.bold,)),
           SizedBox(height: 10.h,),
        ],
      ),
    );
  }
}
