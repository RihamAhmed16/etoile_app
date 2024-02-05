import 'package:etoile_app/bussines_logic/checkout_cubit/check_out_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/data/models/address_model.dart';
import 'package:etoile_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/first_name_last_name_widget.dart';
import '../../../widgets/text_form_widget.dart';
import 'edit_address_screen_drop_down.dart';
import 'edit_adress_bloc_listner.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key, required this.addressModel});

  final AddressModel? addressModel;

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final locationItems = ['Home', 'Work', 'Office 1', 'Office 2', 'Office 3'];
  final cityItems = ['التحرير', 'الحمالية', 'الحسين', 'السبتية', 'السيدة زينب'];
  late TextEditingController firstNameController;

  late TextEditingController lastNameController;

  late TextEditingController streetName;

  late TextEditingController mobileNumberController;

  late TextEditingController buildingNumber;

  late TextEditingController apartmentNumber;

  late TextEditingController floorNumber;

  @override
  void initState() {
    firstNameController =
        TextEditingController(text: widget.addressModel?.firstName ?? '');
    lastNameController =
        TextEditingController(text: widget.addressModel?.lastName ?? '');
    streetName =
        TextEditingController(text: widget.addressModel?.streetName ?? '');
    mobileNumberController =
        TextEditingController(text: widget.addressModel?.phoneNumber ?? '');
    buildingNumber = TextEditingController(
        text: widget.addressModel?.buildingNumber.toString() ?? '');
    apartmentNumber =
        TextEditingController(text: widget.addressModel?.apartmentNumber ?? '');
    buildingNumber = TextEditingController(
        text: widget.addressModel?.buildingNumber.toString() ?? '');
    floorNumber = TextEditingController(
        text: widget.addressModel?.floorNumber.toString() ?? '');
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
              updateAddressDetails(context);
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
                    firstNameController: firstNameController,
                    addressModel: widget.addressModel,
                    lastNameController: lastNameController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  EditDropDownFormFieldWidget(
                      items: locationItems,
                      hintText: widget.addressModel!.orderType,
                      isCity: false,
                      addressModel: widget.addressModel),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Card(
                    elevation: 3.5,
                    child: TextFormWidget(
                      isFromAddressFrom: true,
                      hintText: 'Street Name',
                      controller: streetName,
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
                      controller: buildingNumber,
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
                      controller: floorNumber,
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
                      controller: apartmentNumber,
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
                  EditDropDownFormFieldWidget(
                    items: cityItems,
                    isCity: true,
                    hintText:widget.addressModel!.city,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Card(
                    elevation: 3.4,
                    child: TextFormWidget(
                      isFromAddressFrom: true,
                      hintText: 'Mobile Number',
                      controller: mobileNumberController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const EditAddressBlocListenerWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void updateAddressDetails(BuildContext context) {
    context.read<CheckOutCubit>().editAddressDetails(
        addressId: widget.addressModel!.id,
        addressModel: AddressModel(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            orderType: context.read<CheckOutCubit>().orderPlace == ''
                ? widget.addressModel!.orderType
                : context.read<CheckOutCubit>().orderPlace,
            streetName: streetName.text,
            buildingNumber: int.parse(buildingNumber.text),
            floorNumber: int.parse(floorNumber.text),
            apartmentNumber: apartmentNumber.text,
            city: context.read<CheckOutCubit>().city == ''
                ? widget.addressModel!.city
                : context.read<CheckOutCubit>().city,
            phoneNumber: mobileNumberController.text,
            id: widget.addressModel!.id,
            isDefault: widget.addressModel!.isDefault));
  }
}
