import 'package:etoile_app/constance/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constance/assets_manager.dart';
import '../../constance/colors.dart';
import '../../presentation/widgets/custom_button.dart';

class NotAuthorizedWidget extends StatelessWidget {
  const NotAuthorizedWidget({
    super.key, this.text,
  });
final String ? text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: text!= null ? AppBar(
        title:  Text(text!),
      ):null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AssetsManager.logIn,height: MediaQuery.sizeOf(context).height/4,),
          SizedBox(height: 30.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: CustomButton(
                text: 'LogIn',
                width: double.infinity,
                buttonColor: AppColors.buttonColor,
              onPressed: (){
                  Navigator.pushNamed(context,Routes.loginScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
