import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/data/models/onboarding_model.dart';
import 'package:etoile_app/presentation/widgets/build_onboard_item.dart';
import 'package:etoile_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/cach_helper.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  PageController _controller = PageController();

  bool isLast = false;

  void submit() {
    CashHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value!) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.homeScreen, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.zero,
            ),
              overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            onPressed:submit,
            child:const Text('Skip',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(250, 250, 250, 250),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  if (index == boarding.length) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    BuildOnBoardItem(model: boarding[index], index: index),
                itemCount: boarding.length,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Sign In',
                      width: double.infinity,
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.signUpScreen);
                      },
                      buttonColor: AppColors.buttonColor,
                      verticalPadding: 15.h,
                    ),
                  ),
                   SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: CustomButton(
                      text: 'Sign Up',
                      onPressed: (){
                        Navigator.pushNamed(context, Routes.signUpScreen);
                      },
                      width: double.infinity,
                      buttonColor: AppColors.lightBlack,
                      verticalPadding: 15.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
