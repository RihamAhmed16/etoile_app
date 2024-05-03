import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constance/colors.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        style: ListTileStyle.drawer,
        leading: Icon(icon),
        title: Text(text),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 13.sp,
          color: AppColors.lightBlack,
        ),
      ),
    );
  }
}
