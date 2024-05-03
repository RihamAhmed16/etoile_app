import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../bussines_logic/settings_cubit/settings_cubit.dart';
import '../../../../../constance/colors.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/text_form_widget.dart';
import 'delete_account_listener_widget.dart';

class DeleteUserAccountView extends StatefulWidget {
  const DeleteUserAccountView({super.key});

  @override
  State<DeleteUserAccountView> createState() => _DeleteUserAccountViewState();
}

class _DeleteUserAccountViewState extends State<DeleteUserAccountView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isObscured = true;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Account'),
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormWidget(
                controller: emailController,
                hintText: 'Email',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              TextFormWidget(
                controller: passwordController,
                hintText: 'Password',
                isObscuredText:isObscured,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  child: Icon(
                    isObscured
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
              const DeleteAccountListenerWidget(),
              CustomButton(
                  text: 'Delete',
                  width: 150.w,
                  onPressed: (){
                    if (formKey.currentState!.validate()) {
                      context.read<SettingsCubit>().deleteUser(
                        email: emailController.text,
                        password: passwordController.text,
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
