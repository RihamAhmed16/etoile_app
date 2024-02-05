import 'package:etoile_app/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussines_logic/home_cubit/home_cubit.dart';
import '../../../data/models/cart_model.dart';


void addProductToBasket(BuildContext context, double price, int quantity,Products product) {
  if (BlocProvider.of<StoreCubit>(context)
      .basketProducts
      .map((e) => e.productId)
      .toList()
      .contains(product.productId)) {
    print('quantity');
    price = double.parse(product.price);
    double totalPrice = price * quantity;
    BlocProvider.of<StoreCubit>(context)
        .updateProductQuantity(
      productId: product.productId,
      quantity: quantity,
      price: totalPrice.toString(),
    );
  } else {
    BlocProvider.of<StoreCubit>(context)
        .addToBasket(
      cartModel: CartModel(
          image: product.image,
          price: double.parse(product.price),
          productId: product.productId,
          name: product.name,
          quantity: quantity),
    );
  }
  BlocProvider.of<StoreCubit>(context)
      .getBasketProducts();
}
