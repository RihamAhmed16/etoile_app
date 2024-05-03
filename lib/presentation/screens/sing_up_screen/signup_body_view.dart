import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/data/models/user_model.dart';
import 'package:etoile_app/presentation/widgets/custom_button.dart';
import 'package:etoile_app/presentation/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bussines_logic/auth_cubit/auth_cubit.dart';
import '../../../constance/strings.dart';
import '../../../core/helper/methods/generate_flag.dart';
import '../../../core/helper/methods/toast_message.dart';

class SignupBodyView extends StatefulWidget {
  const SignupBodyView({super.key});

  @override
  State<SignupBodyView> createState() => _SignupBodyViewState();
}

late TextEditingController firstNameController;
late TextEditingController lastNameController;
late TextEditingController emailController;
late TextEditingController mobileNumberController;
late TextEditingController passwordController;
bool isChecked = true;

class _SignupBodyViewState extends State<SignupBodyView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isObscuredText = true;

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    mobileNumberController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    mobileNumberController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listenWhen: (previous, current) {
          return previous != current;
        },
        listener: (context, state) {
          if (state is PhoneSubmittedAuthState) {
            Navigator.pushNamed(
              context,
              Routes.otpScreen,
              arguments: UserModel(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  emailAddress: emailController.text,
                  password: passwordController.text,
                  mobileNumber: mobileNumberController.text),
            );
          }
          if (state is ErrorOccurred) {
            showToast(text: state.errorMessage, state: Toaststate.ERROR);
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
                  Image.asset(
                    Routes.splashImage2,
                    height: 150,
                    width: 150,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormWidget(
                          hintText: 'First Name',
                          controller: firstNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the firstName';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .03,
                      ),
                      Expanded(
                        child: TextFormWidget(
                          hintText: 'Last Name',
                          controller: lastNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the lastName';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  TextFormWidget(
                    controller: emailController,
                    hintText: 'Email Address',
                    validator: (value) {
                      final emailRegex = RegExp(
                          r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
                      if (value!.isEmpty) {
                        return 'Please enter the EmailAddress';
                      } else if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.lightGrey),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Text(
                            '${generateCountryFlag()} +20',
                            style: const TextStyle(
                                fontSize: 18, letterSpacing: 2.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormWidget(
                          controller: mobileNumberController,
                          hintText: 'Mobile Number',
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the phoneNumber';
                            } else if (value.length < 11) {
                              return 'Too short for a phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  TextFormWidget(
                    controller: passwordController,
                    isObscuredText: isObscuredText,
                    hintText: 'Password',
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
                        color: AppColors.buttonColor,
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
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.1,
                        child: Checkbox(
                          activeColor: AppColors.buttonColor,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.black),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(
                                color: Colors.black,
                                height: 1.2,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                              'I Have Read And Agreed On The Terms And Condition Of The App'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  ConditionalBuilder(
                    fallback: (context) => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.buttonColor,
                      ),
                    ),
                    condition: state is! LoadingAuthState,
                    builder: (context) => CustomButton(
                      width: double.infinity,
                      buttonColor: AppColors.buttonColor,
                      text: 'Submit',
                      onPressed: () async {
                        print('pressed');
                        if (!formKey.currentState!.validate()) {
                          return;
                        } else {
                          formKey.currentState!.save();
                          await BlocProvider.of<AuthCubit>(context)
                              .submitPhoneNUmber(
                            userModel: UserModel(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              emailAddress: emailController.text,
                              password: passwordController.text,
                              mobileNumber: mobileNumberController.text,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
