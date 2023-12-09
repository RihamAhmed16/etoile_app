import 'package:etoile_app/cubit/cart/cart.dart';
import 'package:etoile_app/cubit/search/search.dart';
import 'package:flutter/material.dart';

import '../slider/slider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Deliver To'),
        actions: [

  Search(),


          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {

            },
          ),
      Cart(),
     ],
          ),

body: Column(
  children: [
    SliderP(),
    SizedBox(height: 10,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Text('Categories'),
        Text('See All'),
      ],

    ),
    SizedBox(height: 10,),
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

      ],

    ),

  ],



),

          );



  }
}


