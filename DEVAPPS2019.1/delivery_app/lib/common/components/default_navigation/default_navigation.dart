import 'package:delivery_app/common/app_colors/app_colors.dart';
import 'package:delivery_app/common/styles/styles.dart';
import 'package:flutter/material.dart';

class DefaultNavigation extends StatelessWidget {
  final String text;

  DefaultNavigation({this.text});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            key: Key("navigatorBack"),
            iconSize: 16,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            color: AppColors.textPrimaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 8),
            child: Text(
              text,
              style: Styles.headerText,
            ),
          )
        ],
      ),
    );
  }
}
