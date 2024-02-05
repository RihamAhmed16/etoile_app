import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/core/widgets/home_appbar.dart';
import 'package:etoile_app/presentation/widgets/sorting_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/methods/sorting_products.dart';
import '../../../../data/models/product_model.dart';
import 'categories_screen_body_content.dart';

class CategoriesScreenBody extends StatefulWidget {
  const CategoriesScreenBody({
    super.key,
    required this.products,
    required this.searchTerm,
  });

  final List<Products> products;
  final TextEditingController searchTerm;

  @override
  State<CategoriesScreenBody> createState() => _CategoriesScreenBodyState();
}

class _CategoriesScreenBodyState extends State<CategoriesScreenBody> {
  bool isListView = false;
  bool isSearched = false;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<StoreCubit>();
    return Column(
      children: [
        HomeHeader(
          isHome: false,
          products: widget.products,
          textEditingController: widget.searchTerm,
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Showing ${widget.products.length} of ${widget.products.length}'),
              BlocConsumer<StoreCubit, StoreState>(
                listener: (context, state) {
                  if (state is SearchedProductsSuccessState){
                    isSearched = true;
                  }
                },
                builder: (context, state) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          sortingDialog(
                            context,
                            products: isSearched
                                ? cubit.searchedProducts
                                : widget.products,
                          );
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
                      const SortingButtonWidget(
                          iconData: Icons.filter_alt_sharp),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        CategoriesScreenBodyContent(
            products: widget.products, isListView: isListView),
      ],
    );
  }
}

