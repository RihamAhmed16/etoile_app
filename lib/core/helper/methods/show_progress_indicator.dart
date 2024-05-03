import 'package:etoile_app/constance/colors.dart';
import 'package:flutter/material.dart';

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.buttonColor),
      ),
    ),
  );
  showDialog(
      context: context,
      builder: (context) {
        return alertDialog;
      });
}
