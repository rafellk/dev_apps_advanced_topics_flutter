import 'package:delivery_app/common/app_colors/app_colors.dart';
import 'package:delivery_app/common/components/default_background/default_background.dart';
import 'package:delivery_app/common/components/default_button/default_button.dart';
import 'package:delivery_app/common/styles/styles.dart';
import 'package:delivery_app/features/categories_page/categories_page.dart';
import 'package:delivery_app/features/home_tab/home_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        DefaultBackground(
          color: AppColors.splashBackgroundColor,
          imageName: "resources/images/splash_background.png",
        ),
        Container(
            padding: EdgeInsets.only(left: 20, top: 63),
            child: Image.asset("resources/images/logo.png")),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: AppColors.defaultBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("resources/images/splash_icon.png"),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Non-Contact Deliveries",
                      textAlign: TextAlign.center,
                      style: Styles.headerText,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "When placing an order, select the option Contactless delivery and the courier will leave your order at the door",
                      textAlign: TextAlign.center,
                      style: Styles.secondaryText,
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    DefaultButton(
                      text: "ORDER NOW",
                      callback: () {
                        navigateToCategoriesPage(context: context);
                      },
                    ),
                    DefaultButton(
                      text: "DISMISS",
                      callback: () {
                        navigateToCategoriesPage(context: context);
                      },
                      type: DefaultButtonType.secondary,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  navigateToCategoriesPage({BuildContext context}) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeTab()));
  }
}
