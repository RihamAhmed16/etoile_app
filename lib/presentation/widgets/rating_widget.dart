import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../constance/colors.dart';
import '../../data/models/product_model.dart';

class RatingStarWidget extends StatelessWidget {
  const RatingStarWidget({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: product.rating.toDouble(),
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: 20,
      maxRating: 5,
      itemCount: 5,
      // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        size: 20,
        color:AppColors.buttonColor,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
