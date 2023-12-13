import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/slider/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constance/test_list.dart';
import '../../core/widgets/home_appbar.dart';
import '../widgets/best_seller_item.dart';
import '../widgets/categories_widget.dart';
import '../widgets/sections_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: SliderP(),
                  ),
                  const SliverToBoxAdapter(
                    child: CategoriesWidget(),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            Sections(image: imagesForFirstListOfCategories[index]),
                        childCount: 2,
                    ),
                  ),
                const SliverToBoxAdapter(
                    child: BestSellerWidget(),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                          Sections(image: imagesForSecondListOfCategories[index]),
                      childCount: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({super.key,});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Seller',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: AppColors.buttonColor),
              ),
              const Text('See All'),
            ],
          ),
        ),
        SizedBox(
          height: 300.h,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context,index)=>  Padding(
              padding: EdgeInsets.only(left: 8.0.w),
              child:  BestSellerItem(image: imagesForBestSeller[index],),
            ),
          ),
        ),
         SizedBox(height: 5.h,),
      ],
    );
  }
}
