import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constance/colors.dart';
import '../../constance/strings.dart';
import '../../core/helper/methods/add_product_to_basket.dart';
import '../../data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.index,
  });

  final Products product;
  final int index;

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    double price = 0;
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2.0,
                  spreadRadius: 0.9,
                  offset: Offset(.9, 2),
                  blurStyle: BlurStyle.normal),
            ]),
        child: Stack(
          children: [
            if (product.isDiscount == true)
              Positioned(
                top: 20.h,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.w, vertical: 3.h),
                      width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: AppColors.discountColor,
                      ),
                      child: Center(
                          child: Text(
                        '${product.discount.toString()} % Off',
                        style: const TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    child:InkWell(
                      onTap: (){
                        Navigator.pushNamed(
                          context,
                          Routes.productDetailsScreen,
                          arguments: product.productId,
                        );
                      },
                      child: Container(
                        decoration:  BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(product.image),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.buttonColor,
                        foregroundColor: AppColors.buttonColor,
                        radius: 9,
                        child: InkWell(
                          onTap: () {
                            addProductToBasket(context, price, quantity,product);
                          },
                          child: const Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25.w),
                        child: Text(
                          '${product.price}EGP',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10.sp),
                        ),
                      ),
                      if (product.isDiscount == true)
                        Text(
                          '${product.oldPrice.toString()} EGP',
                          style: const TextStyle(
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.red),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
