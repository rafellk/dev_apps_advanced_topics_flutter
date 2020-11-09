import 'package:delivery_app/common/app_colors/app_colors.dart';
import 'package:delivery_app/common/components/default_background/default_background.dart';
import 'package:delivery_app/common/components/default_button/default_button.dart';
import 'package:delivery_app/common/styles/styles.dart';
import 'package:delivery_app/features/home_tab/home_tab.dart';
import 'package:delivery_app/features/splash/splash_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final SplashViewModelInteface viewModel;

  SplashScreen({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        DefaultBackground(
          color: AppColors.splashBackgroundColor,
          imageName: viewModel.defaultBackgroundImage,
        ),
        Container(
            padding: EdgeInsets.only(left: 20, top: 63),
            child: Image.asset(viewModel.logoImage, key: Key("logo"))),
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
                    Image.asset(viewModel.splashIconImage),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      viewModel.title,
                      textAlign: TextAlign.center,
                      style: Styles.headerText,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      viewModel.description,
                      textAlign: TextAlign.center,
                      style: Styles.secondaryText,
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    DefaultButton(
                      key: Key("orderNowButton"),
                      text: viewModel.orderNowButtonTitle,
                      callback: () {
                        navigateToCategoriesPage(context: context);
                      },
                    ),
                    DefaultButton(
                      text: viewModel.dismissButtonTitle,
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
