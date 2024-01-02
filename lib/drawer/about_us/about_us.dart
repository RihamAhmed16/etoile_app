import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {

  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
        " From the bottom of Cairo We Start Etoile ..."
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
                "Since the very beginning ,our main goal is to share people"
                    " their happiness and joy on various occasions "
                    "and draw a smile on the faces of Egyptian family members by offering "
                    "a varietyof high-quality products."
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              "For instance, our bakery products, such as pates, croissants and Danish are
  "  always a good choice for breakfast and
  " also we do breakfast meal and saladfor our customer satisfaction ",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
              SizedBox(height: 16.0),
    Text(" Also we have Western and Oriental sweets.About the ice cream, "
    "it's characterizrized by "
    "its natural ingredients and doesn't contain any additives"
    ,
    style: TextStyle(fontSize: 16.0),
    textAlign: TextAlign.center,
    ),
    SizedBox(height: 16.0),
    Text(
    ,
    style: TextStyle(fontSize: 16.0),
    textAlign: TextAlign.center,
    ),





    ],
        ),
      ),

    );
  }
}
