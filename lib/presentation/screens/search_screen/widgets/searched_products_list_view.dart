import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchedProductsListView extends StatelessWidget {
  const SearchedProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        var cubit = context.read<StoreCubit>();
        if (cubit.searchedProducts.isNotEmpty &&
            state is SearchedProductsSuccessState) {
          return ListView.builder(itemBuilder: (context, index) {
            return ProductItem(
                product: cubit.searchedProducts[index], index: index);
          },
            itemCount: cubit.searchedProducts.length,
          );
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
    );
  }
}
