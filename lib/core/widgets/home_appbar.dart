import 'package:etoile_app/constance/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
            child: const Text('Deliver To'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  size: 15,
                ),
                SizedBox(
                  width: 4.w,
                ),
                const Text('Downtown / Bab el Shearia'),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Change',
                  style: TextStyle(color: AppColors.buttonColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search Here',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(
                          Icons.search,
                          size: 15,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Icon(
                  Icons.card_travel_sharp,
                  color: AppColors.buttonColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
