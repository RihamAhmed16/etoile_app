import 'package:etoile_app/drawer/about_us/about_us.dart';
import 'package:etoile_app/drawer/addresses/addresses.dart';
import 'package:etoile_app/drawer/basket/basket.dart';
import 'package:etoile_app/drawer/basket/basket.dart';
import 'package:etoile_app/drawer/basket/basket.dart';
import 'package:etoile_app/drawer/basket/basket.dart';
import 'package:etoile_app/drawer/branches/branches.dart';
import 'package:etoile_app/drawer/contactus/contactus.dart';
import 'package:etoile_app/drawer/dekivery/delivery.dart';
import 'package:etoile_app/drawer/language/language.dart';
import 'package:etoile_app/drawer/order/order.dart';
import 'package:etoile_app/presentation/screens/homeScreen.dart';
import 'package:flutter/material.dart';

import '../constance/strings.dart';
import 'policy/policy.dart';
import 'profile/profile.dart';
import 'profile/profile.dart';
import 'profile/profile.dart';
import 'profile/profile.dart';
import 'settings/settings.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Drawer(
              child: Container(
      child: ListView(
      children: [
      DrawerHeader(
      child: Center(
          child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
      child:Image.asset("assets/images/etoile.png",fit: BoxFit.cover,),
    ),
    ),
    )
    ],
    ),
    ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      Navigator.pushNamed(context, HomeScreen() as String);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.category),
                    title: Text('Categories'),
                    onTap: () {
                      Navigator.pushNamed(context, categories());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    onTap: () {
                      Navigator.pushNamed(context, Profile() as String);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text('My Basket'),
                    onTap: () {
                      Navigator.pushNamed(context, MyBasket() as String);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.wordpress),
                    title: Text('My Order'),
                    onTap: () {
                      Navigator.pushNamed(context, MyOrder() as String);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.add_home_work_outlined),
                    title: Text('My Addresses'),
                    onTap: () {
                      Navigator.pushNamed(context, MyAddresses() as String);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.pushNamed(context, Settings() as String);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.language_sharp),
                    title: Text('Language'),
                    onTap: () {
                      Navigator.pushNamed(context, Language() as String);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_back_ios_new_outlined),
                    title: Text('About Us'),
                    onTap: () {
                      Navigator.pushNamed(context, AboutUs() as String);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.co_present_outlined),
                    title: Text('Contact Us'),
                    onTap: () {
                      Navigator.pushNamed(context, ContactUs() as String);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.face_retouching_natural_rounded),
                    title: Text('Branches'),
                    onTap: () {
                      Navigator.pushNamed(context, Branches() as String);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.pan_tool_sharp),
                    title: Text('Privacy Policy'),
                    onTap: () {
                      Navigator.pushNamed(context, Policy() as String);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delivery_dining_rounded),
                    title: Text('delivery And Return Policy'),
                    onTap: () {
                      Navigator.pushNamed(context, Delivery() as String);
                    },
                  ),
                ],
              ),
               child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Sign UP',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppStrings.signUpScreen);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
