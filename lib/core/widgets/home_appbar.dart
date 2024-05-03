import 'package:easy_localization/easy_localization.dart';
import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/constance/app_styles.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/constance/translation_constance.dart';
import 'package:etoile_app/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.isHome,
    required this.products,
    this.textEditingController,
  });

  final bool isHome;
  final List<Products> products;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
            child: Text(
              TranslationConstance.deliver.tr(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  size: 15,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  TranslationConstance.place.tr(),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  TranslationConstance.change.tr(),
                  style: TextStyle(
                    color: AppColors.buttonColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (isHome) {
                      Scaffold.of(context).openDrawer();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: Icon(
                    isHome ? Icons.menu : Icons.arrow_back,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: SearchTextFormField(
                      isHome: isHome,
                      textEditingController: textEditingController,
                      products: products),
                ),
                SizedBox(
                  width: 8.w,
                ),
                const BadgeWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    super.key,
    required this.isHome,
    required this.textEditingController,
    required this.products,
  });

  final bool isHome;
  final TextEditingController? textEditingController;
  final List<Products> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1.0,
            spreadRadius: 1.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          if (isHome == true) {
            Navigator.pushNamed(context, Routes.searchScreen);
          } else {
            return;
          }
        },
        child: TextFormField(
          cursorColor: AppColors.buttonColor,
          controller: textEditingController,
          onChanged: (value) {
            if (textEditingController!.text.isEmpty) {
              context.read<StoreCubit>().clearSearchedList();
            } else {
              context
                  .read<StoreCubit>()
                  .searchProduct(searchTerm: value, products: products);
            }
          },
          decoration: InputDecoration(
            hintText: TranslationConstance.search.tr(),
            contentPadding: EdgeInsets.only(bottom: 10.h),
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontFamily: AppStyles.almaraiFontFamily,
            ),
            border: InputBorder.none,
            enabled: isHome ? false : true,
            suffixIcon: Icon(
              Icons.search,
              size: 20.w,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.myBasket);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -10, end: -12),
              showBadge: true,
              ignorePointer: false,
              badgeContent: Text(
                context
                    .read<StoreCubit>()
                    .basketProducts
                    .fold(
                        0,
                        (int accumulator, element) =>
                            accumulator + element.quantity)
                    .toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              badgeStyle: badges.BadgeStyle(
                badgeColor: AppColors.lightBlack,
              ),
              badgeAnimation: const badges.BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),
              child: SvgPicture.asset(
                'assets/icons/basket-shopping-solid.svg',
                height: 20,
                width: 20,
                color: AppColors.buttonColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
