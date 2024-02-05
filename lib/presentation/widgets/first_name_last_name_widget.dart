import 'package:etoile_app/data/models/address_model.dart';
import 'package:etoile_app/presentation/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class FirstAndLastNameWidget extends StatelessWidget {
  const FirstAndLastNameWidget({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    this.addressModel,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final AddressModel? addressModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 3.5,
            child: TextFormWidget(
              hintText: 'First Name',
              isFromAddressFrom: true,
              controller: firstNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                }
                return null;
              },
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .02,
        ),
        Expanded(
          child: Card(
            elevation: 4,
            child: TextFormWidget(
              isFromAddressFrom: true,
              hintText: 'Last Name',
              controller: lastNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
