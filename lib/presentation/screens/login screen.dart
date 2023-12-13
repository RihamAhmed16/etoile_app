import 'package:etoile_app/bussines_logic/login_cubit/log_in_cubit.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/helper/methods/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constance/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/text_form_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;

  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isObscuredText = true;

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<LogInCubit, LogInState>(
            listener: (context, state) {
              if (state is ErrorLogIn) {
                showToast(text: state.errorMessage, state: Toaststate.ERROR);
              }
              if (state is SuccessLogIn) {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppStrings.homeScreen, (route) => false);
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .050,
                      ),
                      Image.asset(
                        AppStrings.splashImage,
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .055,
                      ),
                      TextFormWidget(
                        controller: emailController,
                        hintText: 'Email Address',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else if (!value.contains('@')) {
                            return 'Email Should contain @';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .017),
                      TextFormWidget(
                          controller: passwordController,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscuredText = !isObscuredText;
                              });
                            },
                            child: Icon(
                              isObscuredText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Password';
                            } else if (value.length < 6) {
                              return 'wrong password';
                            } else {
                              return null;
                            }
                          },
                          hintText: 'PassWord'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      CustomButton(
                        width:double.infinity,
                        buttonColor: AppColors.buttonColor,
                        text: 'LOG IN',
                        onPressed: () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          } else {
                            formKey.currentState!.save();
                            LogInCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('You Don\'t Have An Account ?'),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppStrings.signUpScreen);
                            },
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
