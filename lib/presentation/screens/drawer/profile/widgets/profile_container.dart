import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.h,
      height: 120.w,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.6,
            blurRadius: 3,
            offset: const Offset(0,
                3), // Shadow position (left/right, top/bottom)
          ),
        ],
      ),
      child: Center(
        child: Image.asset('assets/images/profile.png'),
      ),
    );
  }
}
