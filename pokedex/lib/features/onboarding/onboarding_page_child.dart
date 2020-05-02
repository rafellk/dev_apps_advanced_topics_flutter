import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';

class OnboardingPageChildModel {
  String mainTitle;
  String secondaryTitle;
  String imageName;
  String buttonTitle;
  Color buttonColor;
  Color buttonBackgroundColor;
  bool shouldPresentButton;
  Function onButtonPressed;

  OnboardingPageChildModel(
      {this.mainTitle,
      this.secondaryTitle,
      this.imageName,
      this.buttonTitle = "",
      this.buttonColor = Colors.white,
      this.buttonBackgroundColor = Colors.black,
      this.shouldPresentButton = false,
      this.onButtonPressed});
}

class OnboardingPageChild extends StatelessWidget {
  final OnboardingPageChildModel model;

  OnboardingPageChild({this.model});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(model.imageName), fit: BoxFit.cover)),
          child: null,
        ),
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                  padding: EdgeInsets.only(top: 150),
                  child: Column(children: <Widget>[])),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(
              child: Container(
                  padding: EdgeInsets.only(bottom: 70),
                  child: Column(
                    children: <Widget>[
                      Text(
                        model.mainTitle,
                        key: Key(OnboardingPageChildModelKeys.mainTitleKey),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 80),
                        child: Text(
                          model.secondaryTitle,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      model.shouldPresentButton
                          ? CupertinoButton(
                            key: Key("button"),
                              child: Text(model.buttonTitle),
                              color: Colors.black,
                              onPressed: () {
                                model.onButtonPressed(context);
                              })
                          : Container(),
                    ],
                  )),
            )
          ],
        )
      ],
    ));
  }
}

class OnboardingPageChildModelKeys {
  static String mainTitleKey = "onboarding_page_child_main_title_key";
}