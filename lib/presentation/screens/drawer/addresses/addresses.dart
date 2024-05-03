import 'package:etoile_app/bussines_logic/checkout_cubit/check_out_cubit.dart';
import 'package:etoile_app/constance/app_styles.dart';
import 'package:etoile_app/constance/assets_manager.dart';
import 'package:etoile_app/core/helper/methods/show_progress_indicator.dart';
import 'package:etoile_app/core/widgets/not_authorized_widget.dart';
import 'package:etoile_app/data/models/address_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constance/colors.dart';
import '../../../../core/DI/dependency_injecion.dart';

class MyAddresses extends StatefulWidget {
  const MyAddresses({super.key});

  @override
  State<MyAddresses> createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {
  @override
  void initState() {
    context.read<CheckOutCubit>().getAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CheckOutCubit>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('My Addresses'),
      ),
      body: BlocConsumer<CheckOutCubit, CheckOutState>(
        listener: (context, state) {
          if (state is RemoveAddressLoading) {
            showProgressIndicator(context);
          }
          if (state is RemoveAddressSuccess) {
            Navigator.pop(context);
            context.read<CheckOutCubit>().getAddress();
          }
        },
        builder: (context, state) {
          if (state is GetAddressSuccess &&
              serviceLocator.get<FirebaseAuth>().currentUser != null) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cubit.address.length,
              itemBuilder: (context, index) {
                final addressModel = cubit.address[index];
                return MyAddressesItem(
                  addressModel: addressModel,
                );
              },
            );
          } else if (serviceLocator.get<FirebaseAuth>().currentUser == null) {
            return const NotAuthorizedWidget();
          } else if (cubit.address.isEmpty) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetsManager.addresses,
                    height: MediaQuery.sizeOf(context).height / 2,
                    width: MediaQuery.sizeOf(context).width / 2,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text(
                    ' Please Add Some Addresses',
                    style: TextStyle(
                        fontFamily: AppStyles.almaraiFontFamily,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          } else if (state is GetAddressLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.buttonColor,
              ),
            );
          } else if (state is GetAddressFailure) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class MyAddressesItem extends StatelessWidget {
  const MyAddressesItem({
    super.key,
    required this.addressModel,
  });

  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        elevation: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w)
                  .copyWith(top: 6.h, bottom: 6.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(addressModel.streetName),
                  Text(
                    '${addressModel.firstName} ${addressModel.lastName}',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    addressModel.city,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    addressModel.phoneNumber,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  if (addressModel.isDefault == true)
                    Text(
                      'this your default address',
                      style: TextStyle(color: AppColors.buttonColor),
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context
                          .read<CheckOutCubit>()
                          .deleteAddress(id: addressModel.id);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            style: BorderStyle.solid,
                            color: AppColors.lightGrey,
                            width: 1.5,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.only(bottom: 3.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete_forever,
                            color: AppColors.lightBlack,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            'Delete',
                            style: TextStyle(color: AppColors.lightBlack),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 3.h),
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Colors.grey.withOpacity(.5)),
                          top: const BorderSide(
                            style: BorderStyle.solid,
                            color: AppColors.lightGrey,
                            width: 1.5,
                          )),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit_calendar_outlined,
                          color: AppColors.lightBlack,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          'Edit',
                          style: TextStyle(color: AppColors.lightBlack),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
