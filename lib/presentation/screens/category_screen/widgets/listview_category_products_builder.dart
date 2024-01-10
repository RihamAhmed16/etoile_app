import 'package:etoile_app/presentation/screens/category_screen/widgets/product_item_for_list_view.dart';
import 'package:flutter/widgets.dart';

import '../../../../data/models/category_model.dart';

class ListViewCategoryProductsBuilder extends StatelessWidget {
  const ListViewCategoryProductsBuilder({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: categoryModel.categoryProducts!.length,
        itemBuilder: (context,index){
      return ProductItemForListView(product: categoryModel.categoryProducts![index],);
    });
  }
}
