import 'package:etoile_app/bussines_logic/home_cubit/home_cubit.dart';
import 'package:etoile_app/constance/colors.dart';
import 'package:etoile_app/constance/strings.dart';
import 'package:etoile_app/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerCategories extends StatelessWidget {
  const DrawerCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: GridView.builder(
        itemCount: context.read<StoreCubit>().categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return DrawerCategoryItem(
            categoryModel: context.read<StoreCubit>().categories[index],
          );
        },
      ),
    );
  }
}

class DrawerCategoryItem extends StatelessWidget {
  const DrawerCategoryItem({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.categoriesScreen,
            arguments: categoryModel);
      },
      child: Container(
        margin:
            EdgeInsets.only(top: 10.h, right: 12.w, left: 12.w, bottom: 10.h),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.white,
                blurRadius: 2.0,
                spreadRadius: 1.9,
                offset: Offset(.9, 2),
                blurStyle: BlurStyle.normal),
          ],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.buttonColor,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 35,
                  backgroundImage: NetworkImage(
                    categoryModel.image!,
                  ),
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Text(categoryModel.name),
            ],
          ),
        ),
      ),
    );
  }
}
