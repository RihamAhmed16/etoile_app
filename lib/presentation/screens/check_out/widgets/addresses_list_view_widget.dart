import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bussines_logic/checkout_cubit/check_out_cubit.dart';
import 'address_item.dart';

class AddressListView extends StatelessWidget {
  const AddressListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocBuilder<CheckOutCubit, CheckOutState>(
        builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: context.read<CheckOutCubit>().address.length,
              itemBuilder: (context, index) {
                final address = context.read<CheckOutCubit>().address[index];
                return AddressItem(
                  addressModel: address,
                );
              },
            );
        },
      ),
    );
  }
}
