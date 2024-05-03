import 'package:etoile_app/bussines_logic/checkout_cubit/check_out_cubit.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constance/colors.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.addressModel,
  });

  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateDefaultAddress(addressModel.id, context);
      },
      child: Card(
        elevation: 3.6,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: addressModel.isDefault == true ? 4.w : 23.w, top: 6.h),
              alignment: Alignment.topLeft,
              child: addressModel.isDefault == true
                  ? Icon(
                      Icons.home_filled,
                      color: AppColors.buttonColor,
                    )
                  : const SizedBox.shrink(),
            ),
            SizedBox(width: 16.w),
            // Adjust the space between leading and title
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(addressModel.orderType),
                  SizedBox(height: 3.h),
                  Text('${addressModel.firstName} ${addressModel.lastName}'),
                  SizedBox(height: 3.h),
                  Text(
                    addressModel.streetName,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 3.h),
                  Text(addressModel.phoneNumber),
                ],
              ),
            ),
            const Spacer(),
            // Add Spacer to push trailing content to the right
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
              child: IconButton(
                alignment: Alignment.bottomCenter,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.addressDetails,
                      arguments: addressModel);
                },
                icon: const Icon(
                  Icons.edit_calendar_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateDefaultAddress(String addressId, BuildContext context) {
    // Find the address with the given id in the list
    AddressModel? selectedAddress = context
        .read<CheckOutCubit>()
        .address
        .firstWhere((address) => address.id == addressId);

    if (selectedAddress != null) {
      // Set isDefault to true for the selected address
      selectedAddress.isDefault = true;

      // Set isDefault to false for all other addresses
      for (AddressModel address in context.read<CheckOutCubit>().address) {
        if (address.id != addressId) {
          address.isDefault = false;
        }
      }
      context.read<CheckOutCubit>().emitStateToUpdateUI();
    }
  }
}
