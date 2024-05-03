import 'package:etoile_app/presentation/screens/search_screen/widgets/searched_screen_body_view.dart';
import 'package:flutter/material.dart';

import '../../../constance/colors.dart';

class SearchScreenView extends StatelessWidget {
  const SearchScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SearchScreenBodyView(
        ),
      ),
    );
  }
}
