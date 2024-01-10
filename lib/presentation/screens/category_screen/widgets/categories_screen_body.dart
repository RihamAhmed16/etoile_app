import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/core/widgets/home_appbar.dart';
import 'package:etoile_app/data/models/category_model.dart';
import 'package:etoile_app/presentation/widgets/sorting_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'categories_screen_body_content.dart';

class CategoriesScreenBody extends StatefulWidget {
  const CategoriesScreenBody({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  State<CategoriesScreenBody> createState() => _CategoriesScreenBodyState();
}

class _CategoriesScreenBodyState extends State<CategoriesScreenBody> {
  bool isListView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeHeader(isHome: false),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Showing ${widget.categoryModel.categoryProducts!.length} of ${widget.categoryModel.categoryProducts!.length}'),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      sortingDialog(context,
                          categoryModel: widget.categoryModel);
                    },
                    child: const SortingButtonWidget(
                      iconData: Icons.sort,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  InkWell(
                    onTap: () {
                      isListView = !isListView;
                      setState(() {});
                    },
                    child: SortingButtonWidget(
                      iconData: isListView
                          ? Icons.grid_view_outlined
                          : Icons.menu_outlined,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  const SortingButtonWidget(iconData: Icons.filter_alt_sharp),
                ],
              ),
            ],
          ),
        ),
        CategoriesScreenBodyContent(
            categoryModel: widget.categoryModel, isListView: isListView),
      ],
    );
  }
}

void sortingDialog(BuildContext context,
    {required CategoryModel categoryModel}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            contentPadding:
                EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Sort By:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                    onTap: () {
                      context.read<StoreCubit>().sortingProducts(
                          categoryModel: categoryModel, char: 'l');
                      Navigator.pop(context);
                    },
                    child: const Text('Price Low To High')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                    onTap: () {
                      context.read<StoreCubit>().sortingProducts(
                          categoryModel: categoryModel, char: 'h');
                      Navigator.pop(context);
                    },
                    child: const Text('Price High To Low')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                    onTap: () {
                      context.read<StoreCubit>().sortingProducts(
                          categoryModel: categoryModel, char: 'b');
                      Navigator.pop(context);
                    },
                    child: const Text('Best Seller')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                    onTap: () {
                      context.read<StoreCubit>().sortingProducts(
                          categoryModel: categoryModel, char: 'n');
                      Navigator.pop(context);
                    },
                    child: const Text('New Arrivals')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                    onTap: () {
                      context.read<StoreCubit>().sortingProducts(
                          categoryModel: categoryModel, char: 'a');
                      Navigator.pop(context);
                    },
                    child: const Text('Product Name A-Z')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                    onTap: () {
                      context.read<StoreCubit>().sortingProducts(
                          categoryModel: categoryModel, char: 'z');
                      Navigator.pop(context);
                    },
                    child: const Text('Product Name Z-A')),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ));
}
