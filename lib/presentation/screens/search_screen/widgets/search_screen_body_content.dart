import 'package:etoile_app/data/models/product_model.dart';
import 'package:etoile_app/presentation/screens/category_screen/widgets/gridview_gategory_products_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bussines_logic/home_cubit/home_cubit.dart';
import '../../../../constance/colors.dart';
import '../../../../core/helper/methods/toast_message.dart';
import '../../category_screen/widgets/listview_category_products_builder.dart';

class SearchScreenBodyContent extends StatelessWidget {
  const SearchScreenBodyContent({
    super.key,
    required this.products,
    required this.isListView,
    required this.searchTerm,
  });

  final List<Products> products;
  final bool isListView;
  final TextEditingController searchTerm;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<StoreCubit, StoreState>(
        listener: (context, state) {
          if (state is AddToBasketLoading) {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.buttonColor,
                ),
              ),
            );
          }
          if (state is AddToBasketSuccess) {
            Navigator.pop(context);
            showToast(
                text: 'The product has been added to your cart Successfully',
                state: Toaststate.SUCCESS);
          }
        },
        builder: (context, state) {
          if (state is SearchedProductsSuccessState ||
              state is ProductsSortingState|| state is ClearSearchedProductsList) {
            return isListView
                ? ListViewCategoryProductsBuilder(
                    products: context.read<StoreCubit>().searchedProducts)
                : GridViewGategoryProductsBuilder(
                    products: context.read<StoreCubit>().searchedProducts);
          } else if (state is SearchedProductsFailureState) {
            return const Center(
              child: Text('No item Found'),
            );
          } else {
            return const Center(
              child: Text('Search For Product'),
            );
          }
        },
      ),
    );
  }
}
