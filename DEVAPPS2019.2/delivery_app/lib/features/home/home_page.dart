import 'package:delivery_app/common/default_background/default_background.dart';
import 'package:delivery_app/common/default_navigation/default_navigation.dart';
import 'package:delivery_app/common/utils/app_colors.dart';
import 'package:delivery_app/features/subcategory/subcategory_page.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final String subtitle;
  final String imageName;

  CategoryModel({this.title, this.subtitle, this.imageName});
}

class HomePage extends StatelessWidget {
  // normally filled by the server
  final List<CategoryModel> dataSource = [
    CategoryModel(
        title: "Vegetables", subtitle: "(12)", imageName: "images/media.png"),
    CategoryModel(
        title: "Fruits", subtitle: "(49)", imageName: "images/media.png"),
    CategoryModel(
        title: "Bread", subtitle: "(38)", imageName: "images/media.png"),
    CategoryModel(
        title: "Sweets", subtitle: "(10)", imageName: "images/media.png"),
    CategoryModel(
        title: "Coffee", subtitle: "(2)", imageName: "images/media.png"),
    CategoryModel(
        title: "Pasta", subtitle: "(70)", imageName: "images/media.png"),
  ];

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
                      children: dataSource.map((model) {
                        return GestureDetector(
                          child: CategoryGridCell(model: model),
                          onTap: () {
                            _navigateToSubcategory(
                                model: model, context: context);
                          },
                        );
                      }).toList(),
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

  _navigateToSubcategory({CategoryModel model, BuildContext context}) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SubCategoryPage(model: model)));
  }
}

class CategoryGridCell extends StatelessWidget {
  final CategoryModel model;

  CategoryGridCell({this.model});

  build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(model.imageName),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    createText(
                        data: model.title,
                        color: AppColors.primaryTextColor,
                        isSmall: false),
                    SizedBox(height: 10),
                    createText(
                        data: model.subtitle,
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
