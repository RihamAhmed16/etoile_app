import 'package:flutter/material.dart';

class MyBasket extends StatelessWidget {

  const MyBasket({Key? key, required this.productName, required this.price, required this.quantity}) : super(key: key);
  final String productName;
  final double price;
  final int quantity;

  CartItemWidget({
    required this.productName,
    required this.price,
    required this.quantity,
  })
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('product image'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(productName),
      subtitle: Text('Price: \$$price'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // زيادة العدد
            },
          ),
          Text(quantity.toString()),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              // نقص العدد
            },
          ),
        ],
      ),
    );

  }
}
List<Map<String, dynamic>> cartItems = [
  {
    'name': 'Product 1',
    'price': 10.0,
    'quantity': 1,
  },
  {
    'name': 'Product 2',
    'price': 20.0,
    'quantity': 2,
  },
  {
    'name': 'Product 3',
    'price': 15.0,
    'quantity': 3,
  },
];