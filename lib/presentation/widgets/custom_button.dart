import 'package:flutter/material.dart';

import '../../constance/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, this.onPressed,
  });
  final String text;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text,),
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(AppColors.buttonColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5))),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              vertical: 10,
            ),
          ),
        ),
      ),
    );
  }
}
