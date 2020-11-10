import 'package:delivery_app/common/default_background/default_background.dart';
import 'package:delivery_app/common/utils/app_colors.dart';
import 'package:delivery_app/features/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  build(BuildContext context) {
    var buttonWidth = MediaQuery.of(context).size.width - 40;

    return Scaffold(
      body: Stack(
        children: [
          DefaultBackground(
            color: AppColors.onboardingBackgroundColor,
            imageName: "onboarding_background_image",
          ),
          Positioned(
            child: Image.asset("images/logo.png"),
            top: 63,
            left: 20,
            height: 80,
            width: 80,
          ),
          createBottomWidget(buttonWidth: buttonWidth, context: context)
        ],
      ),
    );
  }

  Widget createBottomWidget({double buttonWidth, BuildContext context}) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.defaultBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("images/contact_delivery_icon.png"),
                SizedBox(height: 24),
                createText(
                    data: "Non Contact Deliveries",
                    isSmall: false,
                    color: AppColors.primaryTextColor),
                SizedBox(height: 24),
                createText(
                    data:
                        "When placing an order, select an option \"Contactless delivery\" and the courier will leave your order at door",
                    isSmall: true,
                    color: AppColors.secondaryTextColor),
                SizedBox(height: 48),
                Container(
                  width: buttonWidth,
                  child: CupertinoButton(
                    onPressed: () {
                      navigateToHomePage(context: context);
                    },
                    child: createButtonText(
                        data: "ORDER NOW", color: Colors.white),
                    color: AppColors.primaryButtonColor,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  width: buttonWidth,
                  child: CupertinoButton(
                      onPressed: () {
                        navigateToHomePage(context: context);
                      },
                      child: createButtonText(
                          data: "DISMISS",
                          color: AppColors.secondaryTextColor)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  navigateToHomePage({BuildContext context}) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  Text createButtonText({String data, Color color}) {
    var textStyle =
        TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: color);
    return Text(data, style: textStyle);
  }

  Text createText({String data, bool isSmall, Color color}) {
    var textStyle = TextStyle(
        fontSize: isSmall ? 16 : 30,
        color: color,
        fontWeight: isSmall ? FontWeight.normal : FontWeight.bold);

    return Text(
      data,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }
}
