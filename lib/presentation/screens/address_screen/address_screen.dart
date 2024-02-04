import 'package:etoile_app/bussines_logic/checkout_cubit/check_out_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/presentation/screens/address_screen/widgets/address_bloc_listner.dart';
import 'package:etoile_app/presentation/screens/address_screen/widgets/drop_down_from_field_widget.dart';
import 'package:etoile_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/first_name_last_name_widget.dart';
import '../../widgets/text_form_widget.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final locationItems = ['Home', 'Work', 'Office 1', 'Office 2', 'Office 3'];
  final cityItems = ['التحرير', 'الحمالية', 'الحسين', 'السبتية', 'السيدة زينب'];

  @override
  void initState() {
    context.read<CheckOutCubit>().getAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: CustomButton(
          text: 'Save',
          width: double.infinity,
          buttonColor: AppColors.buttonColor,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<CheckOutCubit>().addAddress();
            } else {
              return;
            }
          },
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Address Details',
        ),
      ),
      body: BlocBuilder<CheckOutCubit, CheckOutState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  FirstAndLastNameWidget(
                    firstNameController:
                        context.read<CheckOutCubit>().firstNameController,
                    lastNameController:
                        context.read<CheckOutCubit>().lastNameController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  DropDownFormFieldWidget(items: locationItems, isCity: false),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Card(
                    elevation: 3.5,
                    child: TextFormWidget(
                      isFromAddressFrom: true,
                      hintText: 'Street Name',
                      controller: context.read<CheckOutCubit>().streetName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Card(
                    elevation: 3.4,
                    child: TextFormWidget(
                      isFromAddressFrom: true,
                      hintText: 'Building Number',
                      controller: context.read<CheckOutCubit>().buildingNumber,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Card(
                    elevation: 3.4,
                    child: TextFormWidget(
                      isFromAddressFrom: true,
                      hintText: 'Floor Number',
                      controller: context.read<CheckOutCubit>().floorNumber,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Card(
                    elevation: 3.4,
                    child: TextFormWidget(
                      isFromAddressFrom: true,
                      hintText: 'Apartment Number',
                      controller: context.read<CheckOutCubit>().apartmentNumber,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  DropDownFormFieldWidget(items: cityItems, isCity: true),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Card(
                    elevation: 3.4,
                    child: TextFormWidget(
                      isFromAddressFrom: true,
                      hintText: 'Mobile Number',
                      controller:
                          context.read<CheckOutCubit>().mobileNumberController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const AddressBlocListenerWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
