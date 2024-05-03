import 'package:easy_localization/easy_localization.dart';
import 'package:etoile_app/constance/translation_constance.dart';
import 'package:flutter/material.dart';

import '../../../../constance/colors.dart';

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
      title:  Text(TranslationConstance.descriptions.tr()),
      children: [
        ListTile(
          title: Text(productDescription),
        ),
      ],
    );
  }
}
