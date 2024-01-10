import 'package:flutter/material.dart';

import '../../../constance/strings.dart';
import 'about_us/about_us.dart';
import 'addresses/addresses.dart';
import 'branches/branches.dart';
import 'categories/Categories.dart';
import 'contactus/contactus.dart';
import 'delivery/delivery.dart';
import 'language/language.dart';
import 'order/order.dart';
import 'policy/policy.dart';
import 'profile/profile.dart';
import 'settings/settings.dart';

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
                Navigator.pushNamed(context, AppStrings.homeScreen);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Categories(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, const Profile() as String);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('My Basket'),
              onTap: () {
                Navigator.pushNamed(context, AppStrings.myBasket);
              },
            ),
            ListTile(
              leading: const Icon(Icons.wordpress),
              title: const Text('My Order'),
              onTap: () {
                Navigator.pushNamed(context, const MyOrder() as String);
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_home_work_outlined),
              title: const Text('My Addresses'),
              onTap: () {
                Navigator.pushNamed(context, const MyAddresses() as String);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, const Settings() as String);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language_sharp),
              title: const Text('Language'),
              onTap: () {
                Navigator.pushNamed(context, const Language() as String);
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_back_ios_new_outlined),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pushNamed(context, const AboutUs() as String);
              },
            ),
            ListTile(
              leading: const Icon(Icons.co_present_outlined),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pushNamed(context, const ContactUs() as String);
              },
            ),
            ListTile(
              leading: const Icon(Icons.face_retouching_natural_rounded),
              title: const Text('Branches'),
              onTap: () {
                Navigator.pushNamed(context, const Branches() as String);
              },
            ),
            ListTile(
              leading: const Icon(Icons.pan_tool_sharp),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.pushNamed(context, const Policy() as String);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delivery_dining_rounded),
              title: const Text('delivery And Return Policy'),
              onTap: () {
                Navigator.pushNamed(context, const Delivery() as String);
              },
            ),
          ],),
    );
  }
}
