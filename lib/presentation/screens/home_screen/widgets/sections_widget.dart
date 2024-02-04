import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constance/colors.dart';
import '../../../widgets/custom_button.dart';

class Sections extends StatelessWidget {
  const Sections({
    super.key,
    required this.homeModel, required this.image,
  });

  final CategoryModel homeModel;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, Routes.categoriesScreen,arguments: homeModel);
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
            width: double.infinity,
            height: 200.h,
            decoration:  BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: Offset(2, 2),
                  blurStyle: BlurStyle.solid
                ),
              ],
              image: DecorationImage(image: AssetImage(image,),fit: BoxFit.cover),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
          margin: EdgeInsets.only(bottom: 10.h, left: 10.w, right: 10.w),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: .5,
                spreadRadius: .5,
                offset: Offset(1.2, 1.2),
                blurStyle: BlurStyle.solid,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(homeModel.name),
              ),
              Expanded(
                flex: 1,
                child: CustomButton(
                    width: double.infinity,
                    verticalPadding: 8.h,
                    text: 'Order Now',
                    buttonColor: AppColors.buttonColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
