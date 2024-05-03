import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constance/colors.dart';
import '../../../../../core/helper/functions.dart';
import '../../../../../data/models/address_model.dart';

class AddressDetailsCardWidget extends StatelessWidget {
  const AddressDetailsCardWidget({super.key, required this.addressModel});

  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(capitalizeWords(addressModel.streetName)),
              SizedBox(
                height: 3.h,
              ),
              Text(
                '${addressModel.firstName} ${addressModel.lastName}',
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                addressModel.city,
                style: TextStyle(
                  color: AppColors.lightBlack.withOpacity(.6),
                ),
              ),
              Text(
                addressModel.phoneNumber,
                style: TextStyle(
                  color: AppColors.lightBlack.withOpacity(.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
