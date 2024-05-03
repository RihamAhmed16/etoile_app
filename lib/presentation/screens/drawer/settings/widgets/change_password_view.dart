import 'package:etoile_app/bussines_logic/settings_cubit/settings_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/presentation/widgets/custom_button.dart';
import 'package:etoile_app/presentation/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'change_password_listner_bloc.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  final GlobalKey<FormState> formKey = GlobalKey();
  bool isOldPasswordObscured = true;
  bool isNewPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  @override
  void initState() {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormWidget(
                controller: oldPasswordController,
                hintText: 'Old Password',
                isObscuredText: isOldPasswordObscured,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isOldPasswordObscured = !isOldPasswordObscured;
                    });
                  },
                  child: Icon(
                    isOldPasswordObscured
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the Password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              TextFormWidget(
                controller: newPasswordController,
                hintText: 'New Password',
                isObscuredText: isNewPasswordObscured,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isNewPasswordObscured = !isNewPasswordObscured;
                    });
                  },
                  child: Icon(
                    isNewPasswordObscured
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the Password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              TextFormWidget(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                isObscuredText: isConfirmPasswordObscured,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isConfirmPasswordObscured = !isConfirmPasswordObscured;
                    });
                  },
                  child: Icon(
                    isConfirmPasswordObscured
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the Password';
                  } else if (value != newPasswordController.text) {
                    return 'Your confirmed password does not match the new password';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
             const ChangePasswordListenerWidget(),
              CustomButton(
                  text: 'Change',
                  width: 150.w,
                  onPressed: (){
                    if (formKey.currentState!.validate()) {
                      context.read<SettingsCubit>().changePassword(
                        oldPassword: oldPasswordController.text,
                        newPassword: newPasswordController.text,
                      );
                    }
                  },
                  buttonColor: AppColors.buttonColor),
            ],
          ),
        ),
      ),
    );
  }
}
