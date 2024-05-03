import 'package:etoile_app/bussines_logic/auth_cubit/auth_cubit.dart';
import 'package:etoile_app/constance/assets_manager.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/core/helper/methods/show_progress_indicator.dart';
import 'package:etoile_app/presentation/widgets/custom_button.dart';
import 'package:etoile_app/presentation/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late TextEditingController emailController;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ForgerPasswordLoading) {
            showProgressIndicator(context);
          }
          if (state is ForgerPasswordSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content:
                      Text("Password reset email sent! Check your email.")),
            );
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.loginScreen, (route) => false);
            });
          }
          if (state is ForgerPasswordFailure) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 4.h),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsManager.forgotPassword,
                      height: MediaQuery.sizeOf(context).height / 4,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    TextFormWidget(
                      controller: emailController,
                      hintText: 'your Email',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter The Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      text: 'Send',
                      width: double.infinity,
                      buttonColor: AppColors.buttonColor,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<AuthCubit>()
                              .resetPassword(email: emailController.text);
                        } else {
                          return;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
