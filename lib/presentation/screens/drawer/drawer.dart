import 'package:easy_localization/easy_localization.dart';
import 'package:etoile_app/bussines_logic/auth_cubit/auth_cubit.dart';
import 'package:etoile_app/constance/app_styles.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/translation_constance.dart';
import 'package:etoile_app/core/DI/dependency_injecion.dart';
import 'package:etoile_app/core/helper/methods/show_progress_indicator.dart';
import 'package:etoile_app/presentation/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constance/strings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300.w,
      child: SingleChildScrollView(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoadingAuthState) {
              showProgressIndicator(context);
            }
            if (state is SuccessLogOut) {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.loginScreen,
                (route) => false,
              );
            }
            if (state is FailureLogOut) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          child: Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    "assets/images/etoile.png",
                    fit: BoxFit.cover,
                    width: 80.w,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              const DrawerItem(
                text: TranslationConstance.home,
                iconData: Icons.home,
              ),
              DrawerItem(
                text: TranslationConstance.categories,
                iconData: Icons.category,
                onTap: () {
                  Navigator.pushNamed(context, Routes.drawerCategories);
                },
              ),
              DrawerItem(
                text: TranslationConstance.profile,
                iconData: Icons.person,
                onTap: () {
                  Navigator.pushNamed(context, Routes.profile);
                },
              ),
              DrawerItem(
                text: TranslationConstance.basket,
                iconData: Icons.shopping_cart,
                onTap: () {
                  Navigator.pushNamed(context, Routes.myBasket);
                },
              ),
              DrawerItem(
                text: TranslationConstance.myOrder,
                iconData: Icons.monetization_on,
                onTap: () {
                  Navigator.pushNamed(context, Routes.orders);
                },
              ),
              DrawerItem(
                text: TranslationConstance.myAddresses,
                iconData: Icons.home_work_outlined,
                onTap: () {
                  Navigator.pushNamed(context, Routes.myAddresses);
                },
              ),
              DrawerItem(
                text: TranslationConstance.settings,
                iconData: Icons.settings,
                onTap: () {
                  Navigator.pushNamed(context, Routes.settings);
                },
              ),
              DrawerItem(
                text: TranslationConstance.language,
                iconData: Icons.language_outlined,
                onTap: () {
                  Navigator.pushNamed(context, Routes.language);
                },
              ),
              DrawerItem(
                text: TranslationConstance.aboutUs,
                iconData: Icons.arrow_forward_ios_rounded,
                onTap: () {
                  Navigator.pushNamed(context, Routes.aboutUs);
                },
              ),
              DrawerItem(
                text: TranslationConstance.contactUs,
                iconData: Icons.contact_mail_outlined,
                onTap: () {
                  Navigator.pushNamed(context, Routes.contactUs);
                },
              ),
              DrawerItem(
                text: TranslationConstance.branches,
                iconData: Icons.emoji_flags,
                onTap: () {
                  Navigator.pushNamed(context, Routes.branches);
                },
              ),
              DrawerItem(
                text: TranslationConstance.privacyPolicy,
                iconData: Icons.privacy_tip_outlined,
                onTap: () {
                  Navigator.pushNamed(context, Routes.policy);
                },
              ),
              DrawerItem(
                text: TranslationConstance.deliveryAndReturnPolicy,
                iconData: Icons.local_police,
                onTap: () {
                  Navigator.pushNamed(context, Routes.delivery);
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              if (serviceLocator.get<FirebaseAuth>().currentUser == null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: 'LogIn',
                      width: 100.w,
                      buttonColor: AppColors.buttonColor,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.loginScreen);
                      },
                    ),
                    CustomButton(
                      text: 'SignUp',
                      width: 100.w,
                      buttonColor: AppColors.lightBlack,
                    ),
                  ],
                ),
              if (serviceLocator.get<FirebaseAuth>().currentUser != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomButton(
                    text: 'Logout',
                    width: double.infinity,
                    buttonColor: AppColors.lightBlack,
                    onPressed: () {
                      context.read<AuthCubit>().logOut();
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.text,
    required this.iconData,
    this.onTap,
  });

  final String text;
  final IconData iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          side: BorderSide(
        color: Colors.black45,
        width: 0.4,
      )),
      margin: EdgeInsets.zero,
      child: ListTile(
          style: ListTileStyle.drawer,
          leading: Icon(iconData),
          title: Text(
            text.tr(),
            style: const TextStyle(
              fontFamily: AppStyles.almaraiFontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: onTap),
    );
  }
}
