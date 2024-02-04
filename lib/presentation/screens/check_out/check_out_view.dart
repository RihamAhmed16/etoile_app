import 'package:etoile_app/bussines_logic/checkout_cubit/check_out_cubit.dart';
import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/core/helper/methods/toast_message.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/address_item.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/checkout_product_item.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/checkout_state_widget.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/final_cost_widget.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/payment_method_widget.dart';
import 'package:etoile_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/methods/show_progress_indicator.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  double shippingValue = 30.6;
  late double totalPrice;

  @override
  void initState() {
    context.read<CheckOutCubit>().getAddress();
    totalPrice = context.read<StoreCubit>().totalPrice + shippingValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckOut'),
      ),
      bottomNavigationBar: CustomButton(
        text: 'Next',
        width: double.infinity,
        onPressed: () {
          if (context.read<StoreCubit>().basketProducts.isEmpty) {
            showToast(
                text: 'You Basket is Empty😅 Add some Products 🥰',
                state: Toaststate.SUCCESS);
          } else {
            if (context.read<CheckOutCubit>().activeStep == 2) {
              BlocProvider.of<CheckOutCubit>(context)
                  .addOrder(context: context, totalAmount: totalPrice);
            } else {
              context.read<CheckOutCubit>().activeStep =
                  context.read<CheckOutCubit>().activeStep + 1;
              setState(() {});
            }
          }
        },
        buttonColor: AppColors.buttonColor,
      ),
      body: BlocConsumer<CheckOutCubit, CheckOutState>(
        listener: (context, state) {
          if (state is AddOrderLoading) {
            return showProgressIndicator(context);
          }
          if (state is AddOrderSuccess) {
            context.read<CheckOutCubit>().clearBasket();
          }
          if (state is DeleteBasketSuccess) {
            Navigator.pop(context);
            context.read<StoreCubit>().getBasketProducts();
            if (context.read<CheckOutCubit>().selectedPayment ==
                PaymentMethod.creditCard) {
              Navigator.pushReplacementNamed(context, Routes.creditCard);
            } else {
              Navigator.pushReplacementNamed(context, Routes.successOrder);
            }
          }
          if (state is AddOrderFailure) {
            String errorMessage = state.error;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.redAccent,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // Set the mainAxisSize to MainAxisSize.min
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckOutStateWidget(
                      currentView: context.read<CheckOutCubit>().activeStep),
                  SizedBox(
                    height: 15.h,
                  ),
                  FinalCostWidget(
                      totalPrice: totalPrice, shippingValue: shippingValue),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Addresses',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Routes.address,
                          );
                        },
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (Set<MaterialState> states) {
                            return Colors
                                .transparent; // Set the overlay color to be transparent
                          }),
                        ),
                        child: Text(
                          'New Address',
                          style: TextStyle(
                              color: AppColors.buttonColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  if (context.read<CheckOutCubit>().activeStep == 0)
                    state is GetAddressSuccess || state is ChangeDefaultAddress
                        ? Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  context.read<CheckOutCubit>().address.length,
                              itemBuilder: (context, index) {
                                final address = context
                                    .read<CheckOutCubit>()
                                    .address[index];
                                return AddressItem(
                                  addressModel: address,
                                );
                              },
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  if (context.read<CheckOutCubit>().activeStep == 2 ||
                      context.read<CheckOutCubit>().activeStep == 1)
                    AddressItem(
                      addressModel: context
                          .read<CheckOutCubit>()
                          .address
                          .firstWhere((element) => element.isDefault == true),
                    ),
                  if (context.read<CheckOutCubit>().activeStep == 1)
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.w, vertical: 10.h),
                      child: const Text(
                        'Choose Payment Method',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  if (context.read<CheckOutCubit>().activeStep == 1)
                    const PaymentMethodWidget(),
                  if (context.read<CheckOutCubit>().activeStep == 2)
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 6.h, horizontal: 7.w),
                      child: const Text(
                        'Payment Method',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  if (context.read<CheckOutCubit>().activeStep == 2)
                    Card(
                      elevation: 3.6,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.check_box,
                          color: AppColors.buttonColor,
                          size: 25.sp,
                        ),
                        title: Text(
                          context.read<CheckOutCubit>().selectedPayment ==
                                  PaymentMethod.cashOnDelivery
                              ? 'Cash On Delivery (COD)'
                              : 'Credit Card (VISA)',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  if (context.read<CheckOutCubit>().activeStep == 2)
                    Padding(
                      padding: EdgeInsets.all(4.0.h),
                      child: const Text('Your Items'),
                    ),
                  if (context.read<CheckOutCubit>().activeStep == 2)
                    CheckOutProductsListView(
                        products: context.read<StoreCubit>().basketProducts),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddressListView extends StatelessWidget {
  const AddressListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: context.read<CheckOutCubit>().address.length,
        itemBuilder: (context, index) {
          final address = context.read<CheckOutCubit>().address[index];
          return AddressItem(
            addressModel: address,
          );
        },
      ),
    );
  }
}
