import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/data/models/cart_model.dart';
import 'package:etoile_app/helper/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasketItem extends StatelessWidget {
  const BasketItem({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreCubit, StoreState>(
      listener: (context, state) {
        if(state is RemoveFromBasketSuccess){
          context.read<StoreCubit>().getBasketProducts();
          CashHelper.getData(key: 'cartCount') - 1;
        }
      },
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.productDetailsScreen,
              arguments: cartModel.productId);
        },
        child: Stack(
          children: [
            SizedBox(
              height: 110.h,
              child: Card(
                elevation: 2.2, // Set the elevation here
                margin: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      cartModel.image,
                      height: 120.h,
                      fit: BoxFit.fitHeight,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartModel.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontSize: 14.sp),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${cartModel.price.toString()} EGP',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 24.w,
                                height: 17.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.black54.withOpacity(.3),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  size: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(cartModel.quantity.toString()),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 24.w,
                                height: 17.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.black54.withOpacity(.3),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    context.read<StoreCubit>().removeFromBasket(cartModel: cartModel);
                  },
                  icon: const Icon(
                    Icons.remove_circle,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
