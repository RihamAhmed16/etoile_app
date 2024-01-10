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
      title: const Text('Details'),
      children: [
        Container(
          padding:
          EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black12,
              )),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Product Code: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                  const Text(
                    'Categories: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
