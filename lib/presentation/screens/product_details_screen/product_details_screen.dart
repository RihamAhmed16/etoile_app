import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/add_to_cart_widget.dart';
import 'widgets/product_details_body.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    context.read<StoreCubit>().getProductDetails(productId: widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreState>(
      listenWhen: (previous,current)=>previous!= current,
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
          // showToast(
          //     text: 'The product has been added to your cart Successfully',
          //     state: Toaststate.SUCCESS);
        }
      },
      builder: (context, state) {
        return state is GetProductDetailsLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.buttonColor,
                ),
              )
            : Scaffold(
                bottomNavigationBar: AddToCartButton(
                    product:
                        BlocProvider.of<StoreCubit>(context).productDetails!),
                backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                appBar: AppBar(),
                body: ProductDetailsBody(
                    product:
                        BlocProvider.of<StoreCubit>(context).productDetails!));
      },
    );
  }
}
