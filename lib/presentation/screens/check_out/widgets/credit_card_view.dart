import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'credit_card_widget.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomCreditCard(
                formKey: formKey,
                autoValidateMode: autoValidateMode,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 12, right: 20, left: 20),
                  child: CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Navigator.pushNamed(context, Routes.successOrder);
                        } else {
                          autoValidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                      text: 'PAY!',
                      width: double.infinity,
                      verticalPadding: 17.h,
                      buttonColor: AppColors.buttonColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
