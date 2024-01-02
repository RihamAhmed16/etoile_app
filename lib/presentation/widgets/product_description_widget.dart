import 'package:flutter/material.dart';

import '../../constance/colors.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({
    super.key, required this.productDescription,
  });

  final String productDescription;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      clipBehavior: Clip.none,
      iconColor: AppColors.buttonColor,
      textColor: AppColors.buttonColor,
      title: const Text('Description'),
      children: [
        ListTile(
          title: Text(productDescription),
        ),
      ],
    );
  }
}
