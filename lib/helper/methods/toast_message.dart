import 'package:etoile_app/constance/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String text,
  required Toaststate state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 10,
      backgroundColor: chooseToastcolor(state),
      textColor: Colors.white,
      fontSize: 20.0,
    );

//  enum>> to swap color
enum Toaststate { SUCCESS, ERROR, WARNING }

// method change color
Color? chooseToastcolor(Toaststate state) {
  Color color;
  switch (state) {
    case Toaststate.SUCCESS:
      color = Colors.green;
      break;
    case Toaststate.ERROR:
      color = AppColors.buttonColor;
      break;
    case Toaststate.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
