import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bussines_logic/home_cubit/home_cubit.dart';
import 'basket_item.dart';

class BasketScreenViewBody extends StatelessWidget {
  const BasketScreenViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit,StoreState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: BlocProvider
              .of<StoreCubit>(context)
              .basketProducts
              .length,
          itemBuilder: (context, index) {
            return BasketItem(
              cartModel: BlocProvider
                  .of<StoreCubit>(context)
                  .basketProducts[index],
            );
          },
        );
      },
    );
  }
}
