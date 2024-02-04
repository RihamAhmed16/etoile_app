import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dash_border.dart';

class OrderStateItem extends StatelessWidget {
  const OrderStateItem({
    super.key,
    required this.text, required this.color,
  });

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return DashedBorder(
      color:color,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.sp, color:color),
        ),
      ),
    );
  }
}
