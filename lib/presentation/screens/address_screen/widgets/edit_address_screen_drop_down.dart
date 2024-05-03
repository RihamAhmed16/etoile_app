import 'package:etoile_app/bussines_logic/checkout_cubit/check_out_cubit.dart';
import 'package:etoile_app/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditDropDownFormFieldWidget extends StatefulWidget {
  const EditDropDownFormFieldWidget({
    super.key,
    required this.items,
    required this.isCity,
    this.addressModel,
    required this.hintText,
  });

  final AddressModel? addressModel;
  final List<String> items;
  final bool isCity;
  final String hintText;

  @override
  State<EditDropDownFormFieldWidget> createState() =>
      _EditDropDownFormFieldWidgetState();
}

class _EditDropDownFormFieldWidgetState
    extends State<EditDropDownFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: DropdownButtonFormField<String>(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
        decoration: InputDecoration(
            hintText: widget.hintText,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10.h),),
        items: widget.items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          if (widget.isCity == true) {
            if (value == null) {
              context.read<CheckOutCubit>().city = widget.hintText;
            } else {
              context.read<CheckOutCubit>().city = value;
            }
          } else {
            if (value == null) {
              context.read<CheckOutCubit>().orderPlace = widget.hintText;
            } else {
              context.read<CheckOutCubit>().orderPlace = value;
            }
          }
        },
      ),
    );
  }
}
