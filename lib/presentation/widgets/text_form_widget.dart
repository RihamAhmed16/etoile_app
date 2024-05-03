import 'package:flutter/material.dart';

import '../../constance/colors.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.emailAddress,
    this.validator,
    this.onSaved,
    this.suffixPress,
    this.suffixIcon,
    this.isObscuredText,
    this.hintColor,
    this.isFromAddressFrom = false,
  });

  final Widget? suffixIcon;
  final bool? isObscuredText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final Function()? suffixPress;
  final bool? isFromAddressFrom;
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      obscureText: isObscuredText ?? false,
      cursorColor: AppColors.buttonColor,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        enabledBorder: isFromAddressFrom == false
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(.4),
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(7)),
              )
            : InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        disabledBorder: isFromAddressFrom == false
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(.4),
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(7)),
              )
            : InputBorder.none,
        focusedBorder: isFromAddressFrom == false
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(.4),
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(7)),
              )
            : InputBorder.none,
        border: isFromAddressFrom == false
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(.4),
                  style: BorderStyle.solid,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(7)),
              )
            : InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor ?? Colors.grey.withOpacity(.5),
        ),
      ),
      maxLines: 1,
      controller: controller,
    );
  }
}
