import 'package:etoile_app/presentation/screens/drawer/profile/widgets/profile_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../bussines_logic/auth_cubit/auth_cubit.dart';
import '../../../../constance/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_form_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

late TextEditingController firstNameController;
late TextEditingController lastNameController;
late TextEditingController emailController;
late TextEditingController mobileNumberController;
late TextEditingController passwordController;

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    mobileNumberController = TextEditingController();
    passwordController = TextEditingController();
    context.read<AuthCubit>().getCurrentUserInformation();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final userModel = context.read<AuthCubit>().userModel;
          if (state is GetCurrentUserInformationSuccess && userModel != null) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const ProfileContainer(),
                    SizedBox(height: 10.h),
                    Text(
                      "${userModel.firstName}${userModel.lastName}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14.sp),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      userModel.emailAddress,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0,
                                3), // Shadow position (left/right, top/bottom)
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // First row: First Name and Last Name
                          Row(
                            children: [
                              Expanded(
                                child: TextFormWidget(
                                  hintColor: Colors.black,
                                  hintText: userModel.firstName,
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
                                  hintText: userModel.lastName,
                                  controller: lastNameController,
                                  hintColor: Colors.black,
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
                            hintText: userModel.emailAddress,
                            hintColor: Colors.black,
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
                          TextFormWidget(
                            controller: mobileNumberController,
                            hintText: userModel.mobileNumber!,
                            hintColor: Colors.black,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          CustomButton(
                            width: double.infinity,
                            buttonColor: AppColors.buttonColor,
                            text: 'Save',
                            onPressed: () async {
                              print('pressed');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (userModel == null) {
            return const Center(
              child:Text('something Went Wrong'),
            );
          }else {
            return Center(child: CircularProgressIndicator(color: AppColors.buttonColor,),);
          }
        },
      ),
    );
  }
}
