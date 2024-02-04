import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CheckOutDivider extends StatelessWidget {
  const CheckOutDivider({
    super.key, required this.color,
  });
final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 2.h,
      color:color, // Small horizontal line
    );
  }
}
