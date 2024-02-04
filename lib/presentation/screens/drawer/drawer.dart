import 'package:flutter/material.dart';

import '../../../constance/strings.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
          ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    "assets/images/etoile.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, Routes.homeScreen);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () {
                Navigator.pushNamed(context,Routes.drawerCategories);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context,Routes.profile);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('My Basket'),
              onTap: () {
                Navigator.pushNamed(context, Routes.myBasket);
              },
            ),
            ListTile(
              leading: const Icon(Icons.wordpress),
              title: const Text('My Order'),
              onTap: () {
                Navigator.pushNamed(context, Routes.orders);
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_home_work_outlined),
              title: const Text('My Addresses'),
              onTap: () {
                Navigator.pushNamed(context, Routes.myAddresses);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, Routes.settings);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language_sharp),
              title: const Text('Language'),
              onTap: () {
                Navigator.pushNamed(context, Routes.language);
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_back_ios_new_outlined),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pushNamed(context, Routes.aboutUs);
              },
            ),
            ListTile(
              leading: const Icon(Icons.co_present_outlined),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pushNamed(context,Routes.contactUs);
              },
            ),
            ListTile(
              leading: const Icon(Icons.face_retouching_natural_rounded),
              title: const Text('Branches'),
              onTap: () {
                Navigator.pushNamed(context,Routes.branches);
              },
            ),
            ListTile(
              leading: const Icon(Icons.pan_tool_sharp),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.pushNamed(context,Routes.policy);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delivery_dining_rounded),
              title: const Text('delivery And Return Policy'),
              onTap: () {
                Navigator.pushNamed(context,Routes.delivery);
              },
            ),
          ],),
    );
  }
}
