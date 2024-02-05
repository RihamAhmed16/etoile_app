import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/core/widgets/home_appbar.dart';
import 'package:etoile_app/presentation/screens/search_screen/widgets/search_screen_body_content.dart';
import 'package:etoile_app/presentation/widgets/sorting_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/product_model.dart';

class SearchScreenBodyView extends StatefulWidget {
  const SearchScreenBodyView({
    super.key,
  });

  @override
  State<SearchScreenBodyView> createState() => _SearchScreenBodyViewState();
}

class _SearchScreenBodyViewState extends State<SearchScreenBodyView> {
  late TextEditingController searchedTerm;
  bool isListView = false;
  List<Products> products = [];

  @override
  void initState() {
    searchedTerm = TextEditingController();
    context.read<StoreCubit>().searchedProducts.clear();
    super.initState();
  }

  @override
  void dispose() {
    searchedTerm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<StoreCubit>();
    return Column(
      children: [
        HomeHeader(
          isHome: false,
          textEditingController: searchedTerm,
          products: cubit.allProducts,
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Showing ${products.length} of ${products.length}'),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      sortingDialog(context, products: cubit.searchedProducts);
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
        SearchScreenBodyContent(
            products: cubit.searchedProducts,
            isListView: isListView,
            searchTerm: searchedTerm),
      ],
    );
  }
}

void sortingDialog(BuildContext context, {required List<Products> products}) {
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
                      context
                          .read<StoreCubit>()
                          .sortingProducts(products: products, char: 'l');
                      Navigator.pop(context);
                    },
                    child: const Text('Price Low To High')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                    onTap: () {
                      context
                          .read<StoreCubit>()
                          .sortingProducts(products: products, char: 'h');
                      Navigator.pop(context);
                    },
                    child: const Text('Price High To Low')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                    onTap: () {
                      context
                          .read<StoreCubit>()
                          .sortingProducts(products: products, char: 'b');
                      Navigator.pop(context);
                    },
                    child: const Text('Best Seller')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                    onTap: () {
                      context
                          .read<StoreCubit>()
                          .sortingProducts(products: products, char: 'n');
                      Navigator.pop(context);
                    },
                    child: const Text('New Arrivals')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                    onTap: () {
                      context
                          .read<StoreCubit>()
                          .sortingProducts(products: products, char: 'a');
                      Navigator.pop(context);
                    },
                    child: const Text('Product Name A-Z')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                    onTap: () {
                      context
                          .read<StoreCubit>()
                          .sortingProducts(products: products, char: 'z');
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
