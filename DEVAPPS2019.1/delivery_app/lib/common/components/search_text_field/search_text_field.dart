import 'package:delivery_app/common/app_colors/app_colors.dart';
import 'package:delivery_app/common/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 48,
              child: CupertinoTextField(
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 16),
                  child: Image.asset("resources/images/search_icon.png"),
                ),
                placeholder: "Search",
                placeholderStyle: Styles.secondaryText,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    border: Border.all(
                        color: AppColors.textFieldBorderColor, width: 1)),
              ),
            )
          ],
        ));
  }
}
