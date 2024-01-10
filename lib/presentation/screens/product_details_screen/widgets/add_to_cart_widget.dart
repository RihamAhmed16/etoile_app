import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constance/colors.dart';
import '../../../../data/models/cart_model.dart';
import '../../../widgets/custom_button.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({
    super.key,
    required this.product,
  });

  final Products product;

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  int quantity = 1;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              spreadRadius: 2.7,
              offset: Offset(.9, 2),
              blurStyle: BlurStyle.normal),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 7.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  quantity = quantity + 1;
                  isClicked = true;
                  setState(() {});
                },
                child: Container(
                  width: 24.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.black54.withOpacity(.5),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
              SizedBox(
                width: 7.w,
              ),
              Text('$quantity'),
              SizedBox(
                width: 7.w,
              ),
              GestureDetector(
                onTap: () {
                  if (quantity == 1) {
                    return;
                  } else {
                    quantity = quantity - 1;
                    isClicked = true;
                    setState(() {});
                  }
                },
                child: Container(
                  width: 24.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.black54.withOpacity(.5),
                  ),
                  child: const Icon(Icons.remove),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomButton(
            text: 'Add To Basket',
            width: double.infinity,
            buttonColor: AppColors.buttonColor,
            onPressed: () {
              if (BlocProvider.of<StoreCubit>(context)
                  .basketProducts
                  .map((e) => e.productId)
                  .toList()
                  .contains(widget.product.productId)) {
                int fireBaseQuantity = 0;
                if (isClicked) {
                  fireBaseQuantity = quantity;
                  double price = double.parse(widget.product.price);
                  double totalPrice = price * fireBaseQuantity;
                  BlocProvider.of<StoreCubit>(context).updateProductQuantity(
                    productId: widget.product.productId,
                    quantity: fireBaseQuantity,
                    price: totalPrice.toString(),
                  );
                } else {
                  fireBaseQuantity = 1;
                  BlocProvider.of<StoreCubit>(context).updateProductQuantity(
                    productId: widget.product.productId,
                    quantity: fireBaseQuantity,
                    price: widget.product.price,
                  );
                }
              } else {
                BlocProvider.of<StoreCubit>(context)
                    .addToBasket(
                  cartModel: CartModel(
                      image: widget.product.image,
                      price: double.parse(widget.product.price),
                      productId: widget.product.productId,
                      name: widget.product.name,
                      quantity: quantity),
                )
                    .then((value) {
                  BlocProvider.of<StoreCubit>(context).getBasketProducts();
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
