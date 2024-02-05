import 'package:etoile_app/data/models/product_model.dart';
import 'package:etoile_app/presentation/screens/category_screen/widgets/product_item_for_list_view.dart';
import 'package:flutter/widgets.dart';


class ListViewCategoryProductsBuilder extends StatelessWidget {
  const ListViewCategoryProductsBuilder({super.key, required this.products});
  final List<Products> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
        itemBuilder: (context,index){
      return ProductItemForListView(product: products[index],);
    });
  }
}
