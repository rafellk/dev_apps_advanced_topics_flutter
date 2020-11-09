import 'package:delivery_app/common/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  build(BuildContext context) {
    var buttonWidth = MediaQuery.of(context).size.width - 40;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
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
                  onPressed: () {},
                  child: Text("ORDER NOW"),
                  color: AppColors.primaryButtonColor,
                ),
              ),
              SizedBox(height: 4),
              Container(
                width: buttonWidth,
                child:
                    CupertinoButton(onPressed: () {}, child: Text("DISMISS")),
              )
            ],
          ),
        ),
      ),
    );
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
