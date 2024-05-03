import 'package:easy_localization/easy_localization.dart';
import 'package:etoile_app/constance/translation_constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constance/colors.dart';
import '../../../../data/models/product_model.dart';

class DetailsContainerWidget extends StatelessWidget {
  const DetailsContainerWidget({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      clipBehavior: Clip.none,
      iconColor: AppColors.buttonColor,
      textColor: AppColors.buttonColor,
      title: Text(TranslationConstance.details.tr()),
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black12,
              )),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '${TranslationConstance.productCode.tr()} : ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(product.productCode),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              const Row(
                children: [
                  Text(
                    'Brand: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Etoile'),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Text(
                    '${TranslationConstance.categories.tr()} : ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(product.category),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
