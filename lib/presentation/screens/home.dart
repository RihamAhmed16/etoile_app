import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/slider/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/home_appbar.dart';
import '../../data/models/home_model.dart';
import '../widgets/best_seller_item.dart';
import '../widgets/categories_widget.dart';
import '../widgets/sections_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Future.wait([
      context.read<HomeCubit>().getBestSeller(),
      context.read<HomeCubit>().getCategories(),
      context.read<HomeCubit>().getSections(),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(),
            BlocBuilder<HomeCubit, HomeState>(
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
                                context.read<HomeCubit>().categories,
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => Sections(
                              homeModel: context
                                  .read<HomeCubit>()
                                  .firstSections[index],
                            ),
                            childCount:
                                context.read<HomeCubit>().firstSections.length,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: BestSellerWidget(
                            bestSeller: context.read<HomeCubit>().bestSeller,
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => Sections(
                                homeModel: context
                                    .read<HomeCubit>()
                                    .secondSections[index]),
                            childCount:
                                context.read<HomeCubit>().secondSections.length,
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

  final List<HomeModel> bestSeller;

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
          height: 300.h,
          child: ListView.builder(
            itemCount: bestSeller.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: 8.0.w),
              child: BestSellerItem(
                bestSellerModel: context.read<HomeCubit>().bestSeller[index],
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
