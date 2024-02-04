import 'package:etoile_app/bussines_logic/checkout_cubit/check_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownFormFieldWidget extends StatefulWidget {
  const DropDownFormFieldWidget({
    super.key,
    required this.items,
    required this.isCity,
  });

  final List<String> items;
  final bool isCity;

  @override
  State<DropDownFormFieldWidget> createState() =>
      _DropDownFormFieldWidgetState();
}

class _DropDownFormFieldWidgetState extends State<DropDownFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: DropdownButtonFormField<String>(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a value';
          }
          return null;
        },
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
        decoration: InputDecoration(
          hintText: 'Select Value',
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10.h)),
        items: widget.items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          if (widget.isCity == true) {
            context.read<CheckOutCubit>().city = value!;
          } else {
            context.read<CheckOutCubit>().orderPlace = value ?? widget.items[0];
          }
        },
      ),
    );
  }
}
