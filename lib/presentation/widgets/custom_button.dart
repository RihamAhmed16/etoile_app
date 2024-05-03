import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.width, required this.buttonColor, this.horizontalPadding, this.verticalPadding,
  });

  final String text;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double width;
  final void Function()? onPressed;
final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              vertical: verticalPadding??10,
            ),
          ),
        ),
        child: Text(
          text,
          style:const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
