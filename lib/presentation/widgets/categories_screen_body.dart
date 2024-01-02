import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/core/widgets/home_appbar.dart';
import 'package:etoile_app/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constance/colors.dart';
import '../../data/models/product_model.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeHeader(),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'Showing ${categoryModel.categoryProducts!.length} of ${categoryModel.categoryProducts!.length}'),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      sortingDialog(context, categoryModel: categoryModel);
                    },
                    child: const SortingButtonWidget(
                      iconData: Icons.sort,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  const SortingButtonWidget(iconData: Icons.menu_rounded),
                  SizedBox(
                    width: 5.w,
                  ),
                  const SortingButtonWidget(iconData: Icons.filter_alt_sharp),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<StoreCubit, StoreState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return state is ProductsLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: .65,
                      ),
                      itemBuilder: (context, index) => ProductItem(
                        product: categoryModel.categoryProducts![index],
                        index: index,
                      ),
                      itemCount: categoryModel.categoryProducts!.length,
                    );
            },
          ),
        ),
      ],
    );
  }
}

class SortingButtonWidget extends StatelessWidget {
  const SortingButtonWidget({
    super.key,
    required this.iconData,
  });

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 250, 250, 250),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 1.3,
              offset: Offset(.4, 2),
              blurStyle: BlurStyle.solid),
        ],
      ),
      child: Icon(iconData),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.index,
  });

  final Products product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppStrings.productDetailsScreen,
          arguments: product,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.0.h),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                    spreadRadius: 0.9,
                    offset: Offset(.9, 2),
                    blurStyle: BlurStyle.normal),
              ]),
          child: Stack(
            children: [
              if (product.isDiscount == true)
                Positioned(
                  top: 20.h,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 3.h),
                        width: 70.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: AppColors.discountColor,
                        ),
                        child: Center(
                            child: Text(
                          '${product.discount.toString()} % Off',
                          style: const TextStyle(color: Colors.white),
                        )),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(product.image))),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.buttonColor,
                          foregroundColor: AppColors.buttonColor,
                          radius: 9,
                          child: const Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: Text(
                            '${product.price}EGP',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 10.sp),
                          ),
                        ),
                        if (product.isDiscount == true)
                          Text(
                            '${product.oldPrice.toString()} EGP',
                            style: const TextStyle(
                                color: Colors.grey,
                                overflow: TextOverflow.ellipsis,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.red),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
                  onTap: (){
                    context.read<StoreCubit>().sortingProducts(
                        categoryModel: categoryModel, char: 'h');
                    Navigator.pop(context);
                  },
                    child: const Text('Price High To Low')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                  onTap: (){
                    context.read<StoreCubit>().sortingProducts(
                        categoryModel: categoryModel, char: 'b');
                    Navigator.pop(context);
                  },
                    child: const Text('Best Seller')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                  onTap: (){
                    context.read<StoreCubit>().sortingProducts(
                        categoryModel: categoryModel, char: 'n');
                    Navigator.pop(context);
                  },
                    child: const Text('New Arrivals')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                  onTap: (){
                    context.read<StoreCubit>().sortingProducts(
                        categoryModel: categoryModel, char: 'a');
                    Navigator.pop(context);
                  },
                    child: const Text('Product Name A-Z')),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                  onTap: (){
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
