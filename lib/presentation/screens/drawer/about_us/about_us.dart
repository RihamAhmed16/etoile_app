import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              " From the bottom of Cairo We Start Etoile ...",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              "Since the very beginning ,our main goal is to share people their\n happiness and joy on various occasion and draw a smile on\n the faces of Egyptian family members by offering\n a variety of high-quality products.",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'For instance, our bakery products, such as pates, croissants and\n Danish are always a good choice for breakfast an also we do\n breakfast meal and salad for our customer satisfaction',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'Also we have Western and Oriental sweets.About the ice\n cream,it\'s characterized by its natural ingredients and doesn\'t\n contain any additives',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'When it comes to feasts and special occasions, either Eid or El Mouled El Nabwi, we are honored that our customers can always rely on us. Our production of Kahk and Halawet Mouled is characterized by craftsmanship which is the secret of our distinction as well as the fresh homemade savor that satisfies the Egyptian taste.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            Text(
              'Also, In order not to increase our success we add our products in the  most of hyper and large market inside Cairo and most of provinces ..\nWe also opened cafe and restaurant in the most of our branches..\nAnd the story still has a continuation and the expansion plan is not finished yet. Tell we arrive to our customers in Cairo and the other provinces ..',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
