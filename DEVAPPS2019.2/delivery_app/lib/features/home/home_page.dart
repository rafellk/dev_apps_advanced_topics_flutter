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
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 21),
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [
                        CategoryGridCell(),
                        CategoryGridCell(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryGridCell extends StatelessWidget {
  build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("images/media.png"),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    createText(
                        data: "Vegetables",
                        color: AppColors.primaryTextColor,
                        isSmall: false),
                    SizedBox(height: 10),
                    createText(
                        data: "(43)",
                        color: AppColors.secondaryTextColor,
                        isSmall: true),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Text createText({String data, bool isSmall, Color color}) {
    var textStyle = TextStyle(
        fontSize: isSmall ? 12 : 17,
        color: color,
        fontWeight: isSmall ? FontWeight.w300 : FontWeight.bold);

    return Text(
      data,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }
}
