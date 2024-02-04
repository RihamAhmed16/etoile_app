import 'package:etoile_app/presentation/screens/category_screen/widgets/gridview_gategory_products_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bussines_logic/home_cubit/home_cubit.dart';
import '../../../../constance/colors.dart';
import '../../../../core/helper/methods/toast_message.dart';
import '../../../../data/models/category_model.dart';
import 'listview_category_products_builder.dart';

class CategoriesScreenBodyContent extends StatelessWidget {
  const CategoriesScreenBodyContent({
    super.key,
    required this.categoryModel,
    required this.isListView,
  });

  final CategoryModel categoryModel;
  final bool isListView;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<StoreCubit, StoreState>(
        listenWhen: (previous,current)=> previous!=current,
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
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return state is ProductsLoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : isListView
                  ? ListViewCategoryProductsBuilder(
                      categoryModel: categoryModel)
                  : GridViewGategoryProductsBuilder(
                      categoryModel: categoryModel);
        },
      ),
    );
  }
}
