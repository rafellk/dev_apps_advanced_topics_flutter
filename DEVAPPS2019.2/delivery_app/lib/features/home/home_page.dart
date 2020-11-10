import 'package:delivery_app/common/default_background/default_background.dart';
import 'package:delivery_app/common/default_navigation/default_navigation.dart';
import 'package:delivery_app/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DefaultBackground(color: AppColors.defaultBackgroundColor),
          SafeArea(
            child: Column(
              children: [
                DefaultNavigation(
                  title: "Categories",
                  placeholder: "Search",
                  textChanged: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
