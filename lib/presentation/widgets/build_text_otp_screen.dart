import 'package:flutter/material.dart';

import '../../constance/app_styles.dart';

class BuildIntroText extends StatelessWidget {
  const BuildIntroText({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Verify your Phone Number',
          style: AppStyles.textStyle24,
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
              text: 'Enter your 6 digit code number sent to ',
              style: AppStyles.textStyle18,
              children: <TextSpan>[
                TextSpan(
                  text: '+201002834247',
                  style: TextStyle(color: Colors.blue),
                ),
              ]
            ),
          ),
        ),
      ],
    );
  }
}
