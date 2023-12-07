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
    this.suffix,
    this.suffixPress, this.isPassword= false,
  });

  final IconData? suffix;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final Function()? suffixPress;
final bool ? isPassword ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      obscureText: false,
      cursorColor: AppColors.buttonColor,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPress, icon: Icon(suffix))
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.4),
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.4),
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.4),
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(.4),
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(.5),
        ),
      ),
      maxLines: 1,
      clipBehavior: Clip.hardEdge,
      controller: controller,
    );
  }
}
