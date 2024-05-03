import 'package:easy_localization/easy_localization.dart';
import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/bussines_logic/settings_cubit/settings_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/translation_constance.dart';
import 'package:etoile_app/helper/cach_helper.dart';
import 'package:etoile_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/language_services.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
      if (state is LanguageLoaded) {
        context.setLocale(state.locale);
        LanguageService.instance.languageCode = state.locale.languageCode;
        CashHelper.saveData(
            key: 'languageCode', value: state.locale.languageCode);
        // Future.wait([
        //   context.read<StoreCubit>().getBestSeller(),
        //   context.read<StoreCubit>().getCategories(),
        // ]);
      }
    }, builder: (context, state) {
      if (state is LanguageLoaded) {
        return Scaffold(
          appBar: AppBar(
            title: Text(TranslationConstance.language.tr()),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.language_sharp,
                  color: AppColors.buttonColor,
                  size: 80.sp,
                ),
                SizedBox(height: 25.h),
                CustomButton(
                  text: 'English',
                  onPressed: () {
                    context
                        .read<SettingsCubit>()
                        .changeLocale(const Locale('en'));
                  },
                  width: MediaQuery.sizeOf(context).width / 2.5,
                  buttonColor: AppColors.buttonColor,
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  text: 'العربية',
                  onPressed: () {
                    context.read<SettingsCubit>().changeLocale(
                          const Locale('ar'),
                        );
                  },
                  width: MediaQuery.sizeOf(context).width / 2.5,
                  buttonColor: AppColors.lightBlack,
                  verticalPadding: 4.h,
                ),
                Text(TranslationConstance.profile.tr()),
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text(TranslationConstance.language.tr()),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.language_sharp,
                  color: AppColors.buttonColor,
                  size: 80.sp,
                ),
                SizedBox(height: 25.h),
                CustomButton(
                  text: 'English',
                  onPressed: () {
                    context
                        .read<SettingsCubit>()
                        .changeLocale(const Locale('en'));
                  },
                  width: MediaQuery.sizeOf(context).width / 2.5,
                  buttonColor: AppColors.buttonColor,
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  text: 'العربية',
                  onPressed: () {
                    context
                        .read<SettingsCubit>()
                        .changeLocale(const Locale('ar'));
                  },
                  width: MediaQuery.sizeOf(context).width / 2.5,
                  buttonColor: AppColors.lightBlack,
                  verticalPadding: 4.h,
                ),
                Text(TranslationConstance.profile.tr()),
              ],
            ),
          ),
        );
      }
    });
  }
}
