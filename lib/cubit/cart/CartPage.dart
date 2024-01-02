import 'package:etoile_app/drawer/basket/basket.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
            //  itemCount:   .length,
              itemBuilder: (context, index) {
                return MyBasket(
                  productName: cartItems[index]['name'],
                  price: cartItems[index]['price'],
                  quantity: cartItems[index]['quantity'],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total: \$${calculateTotalPrice()}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                RaisedButton(
                  onPressed: () {

                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var item in cartItems) {
      totalPrice += (item['price'] * item['quantity']);
    }
    return totalPrice;
  }
}
