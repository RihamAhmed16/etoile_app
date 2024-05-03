import 'package:etoile_app/bussines_logic/checkout_cubit/check_out_cubit.dart';
import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/core/helper/methods/toast_message.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/address_item.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/addresses_list_view_widget.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/checkout_product_item.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/checkout_state_widget.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/choosen_payment_widget.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/final_cost_widget.dart';
import 'package:etoile_app/presentation/screens/check_out/widgets/header_addresses_section.dart';
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
  int activeStep = 0;

  @override
  void initState() {
    context.read<CheckOutCubit>().getAddress();
    totalPrice = context.read<StoreCubit>().totalPrice + shippingValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var checkOutCubit = context.read<CheckOutCubit>();
    var storeCubit = context.read<StoreCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckOut'),
      ),
      bottomNavigationBar: CustomButton(
        text: 'Next',
        width: double.infinity,
        onPressed: () {
          if (storeCubit.basketProducts.isEmpty) {
            showToast(
                text: 'You Basket is Empty😅 Add some Products 🥰',
                state: Toaststate.SUCCESS);
          } else {
            if (checkOutCubit.activeStep == 2) {
              checkOutCubit.addOrder(context: context, totalAmount: totalPrice);
            } else {
              checkOutCubit.activeStep = checkOutCubit.activeStep + 1;
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
            whenDeleteBasketSuccessMethod(context);
          }
          if (state is AddOrderFailure) {
            whenAddOrderFailureMethod(state, context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckOutStateWidget(currentView: checkOutCubit.activeStep),
                  SizedBox(
                    height: 15.h,
                  ),
                  FinalCostWidget(
                      totalPrice: totalPrice, shippingValue: shippingValue),
                  SizedBox(
                    height: 2.h,
                  ),
                  const HeaderAddressesSection(),
                  if (checkOutCubit.activeStep == 0)
                    state is GetAddressSuccess ||
                            state is ChangeDefaultAddress ||
                            state is AddAddressSuccess
                        ? const AddressListView()
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  if (checkOutCubit.activeStep == 2 ||
                      checkOutCubit.activeStep == 1)
                    AddressItem(
                      addressModel: checkOutCubit.address
                          .firstWhere((element) => element.isDefault == true),
                    ),
                  if (checkOutCubit.activeStep == 1)
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.w, vertical: 10.h),
                      child: const Text(
                        'Choose Payment Method',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  if (checkOutCubit.activeStep == 1)
                    const PaymentMethodWidget(),
                  if (checkOutCubit.activeStep == 2)
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 6.h, horizontal: 7.w),
                      child: const Text(
                        'Payment Method',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  if (checkOutCubit.activeStep == 2)
                    ChoosenPaymentMethodWidget(cubit: checkOutCubit),
                  if (checkOutCubit.activeStep == 2)
                    Padding(
                      padding: EdgeInsets.all(4.0.h),
                      child: const Text('Your Items'),
                    ),
                  if (checkOutCubit.activeStep == 2)
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

  void whenAddOrderFailureMethod(AddOrderFailure state, BuildContext context) {
    String errorMessage = state.error;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void whenDeleteBasketSuccessMethod(BuildContext context) {
    Navigator.pop(context);
    context.read<StoreCubit>().getBasketProducts();
    if (context.read<CheckOutCubit>().selectedPayment ==
        PaymentMethod.creditCard) {
      Navigator.pushReplacementNamed(context, Routes.creditCard);
    } else {
      Navigator.pushReplacementNamed(context, Routes.successOrder);
    }
  }
}
