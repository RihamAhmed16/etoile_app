// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'cart_cubit.dart';
//
// class Cart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My App'),
//       ),
//       body: BlocBuilder<CartCubit, List<String>>(
//         builder: (context, state) {
//           return ListView.builder(
//             itemCount: state.length,
//             itemBuilder: (context, index) {
//               final product = state[index];
//               return ListTile(
//                 title: Text(product),
//                 trailing: IconButton(
//                   icon: Icon(Icons.remove_shopping_cart),
//                   onPressed: () {
//                     context.read<CartCubit>().removeFromCart(product);
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add_shopping_cart),
//         onPressed: () {
//           final product = 'New Product';
//           context.read<CartCubit>().addToCart(product);
//         },
//       ),
//     );
//   }
// }