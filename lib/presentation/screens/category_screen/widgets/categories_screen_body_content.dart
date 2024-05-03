import 'package:etoile_app/data/models/product_model.dart';
import 'package:etoile_app/presentation/screens/category_screen/widgets/gridview_gategory_products_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bussines_logic/home_cubit/home_cubit.dart';
import 'listview_category_products_builder.dart';

class CategoriesScreenBodyContent extends StatefulWidget {
  const CategoriesScreenBodyContent({
    super.key,
    required this.products,
    required this.isListView,
  });

  final List<Products> products;
  final bool isListView;

  @override
  State<CategoriesScreenBodyContent> createState() =>
      _CategoriesScreenBodyContentState();
}

class _CategoriesScreenBodyContentState
    extends State<CategoriesScreenBodyContent> {
  late List<Products> finalProducts;

  @override
  void initState() {
    finalProducts = widget.products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<StoreCubit, StoreState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state is SearchedProductsSuccessState) {
              finalProducts = context.read<StoreCubit>().searchedProducts;
            }
            if (state is ClearSearchedProductsList) {
              finalProducts = widget.products;
            }
            if (state is ProductsSuccessState) {
              finalProducts = widget.products;
            }
          },
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return state is ProductsLoadingState
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : widget.isListView
                    ? ListViewCategoryProductsBuilder(products: finalProducts)
                    : GridViewGategoryProductsBuilder(products: finalProducts);
          }),
    );
  }
}
