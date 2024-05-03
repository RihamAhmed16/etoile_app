import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/core/DI/dependency_injecion.dart';
import 'package:etoile_app/data/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussines_logic/home_cubit/home_cubit.dart';
import '../../../data/models/cart_model.dart';

void addProductToBasket(BuildContext context, int quantity, Products product) {
  var user = serviceLocator.get<FirebaseAuth>().currentUser;
  if (user == null) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign In Required'),
          content: const Text('You must be signed in to add products to the basket.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Sign Up'),
              onPressed: () {
                // Navigate to the Sign Up screen
                Navigator.pushNamed(context, Routes.signUpScreen);
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                // Just close the dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } else {
    if (BlocProvider.of<StoreCubit>(context)
        .basketProducts
        .map((e) => e.productId)
        .toList()
        .contains(product.productId)) {
      print('quantity');
      double price = double.parse(product.price);
      BlocProvider.of<StoreCubit>(context).updateProductQuantity(
        productId: product.productId,
        quantity: quantity,
        price: price,
      );
    } else {
      BlocProvider.of<StoreCubit>(context).addToBasket(
        cartModel: CartProduct(
            image: product.image,
            price: double.parse(product.price),
            productId: product.productId,
            name: product.name,
            quantity: quantity),
      );
    }
    BlocProvider.of<StoreCubit>(context).getBasketProducts();
  }
}
