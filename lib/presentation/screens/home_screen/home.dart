import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/data/models/product_model.dart';
import 'package:etoile_app/helper/cach_helper.dart';
import 'package:etoile_app/slider/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constance/test_list.dart';
import '../../../core/widgets/home_appbar.dart';
import '../drawer/drawer.dart';
import 'widgets/best_seller_item.dart';
import 'widgets/categories_widget.dart';
import 'widgets/sections_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
      Future.wait([
      context.read<StoreCubit>().getBestSeller(),
      context.read<StoreCubit>().getCategories(),
      context.read<StoreCubit>().getBasketProducts(),
    ]).then((value) {
        if(context.read<StoreCubit>().basketProducts.isEmpty){
          CashHelper.deleteData(key:'cartCount');
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyHomePage(),
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(isHome: true),
            BlocBuilder<StoreCubit, StoreState>(
              builder: (context, state) {
                if (state is BestSellerLoadingState ||
                    state is CategoriesLoadingState ||
                    state is SectionsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: SliderP(),
                        ),
                        SliverToBoxAdapter(
                          child: CategoriesWidget(
                            categoriesModel:
                                context.read<StoreCubit>().categories,
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => Sections(
                              homeModel: context
                                  .read<StoreCubit>()
                                  .firstSections[index],
                              image:imagesForFirstListOfCategories[index] ,
                            ),
                            childCount:
                                context.read<StoreCubit>().firstSections.length,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: BestSellerWidget(
                            bestSeller: context.read<StoreCubit>().bestSeller,
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => Sections(
                                homeModel: context
                                    .read<StoreCubit>()
                                    .secondSections[index],
                              image: imagesForSecondListOfCategories[index],
                            ),
                            childCount:
                                context.read<StoreCubit>().secondSections.length,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({
    super.key,
    required this.bestSeller,
  });

  final List<Products> bestSeller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
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
          height: 250.h,
          child: ListView.builder(
            itemCount: bestSeller.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: 8.0.w),
              child: BestSellerItem(
                bestSellerModel: context.read<StoreCubit>().bestSeller[index],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
      ],
    );
  }
}
