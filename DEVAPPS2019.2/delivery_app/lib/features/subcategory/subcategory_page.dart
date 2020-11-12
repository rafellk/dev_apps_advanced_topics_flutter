import 'package:delivery_app/common/default_background/default_background.dart';
import 'package:delivery_app/common/default_navigation/default_navigation.dart';
import 'package:delivery_app/common/utils/app_colors.dart';
import 'package:delivery_app/features/home/home_page.dart';
import 'package:flutter/material.dart';

class SubCategoryModel {
  String title;
  double price;
  String currency;
  String unit;
  String imageName;

  SubCategoryModel(
      {this.title, this.price, this.currency, this.unit, this.imageName});
}

class SubCategoryPage extends StatelessWidget {
  final CategoryModel model;
  final List<SubCategoryModel> dataSource = [
    SubCategoryModel(
        title: "Boston Lettuce",
        price: 1.10,
        currency: "€",
        unit: "piece",
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Purple Cauliflower",
        price: 1.85,
        currency: "€",
        unit: "kg",
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Savoy Cabbage",
        price: 1.45,
        currency: "€",
        unit: "g",
        imageName: "images/subcategory_placeholder.png"),
  ];

  SubCategoryPage({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        DefaultBackground(color: AppColors.defaultBackgroundColor),
        SafeArea(
          child: Column(
            children: [
              DefaultNavigation(
                title: model.title,
                placeholder: "Search",
                isLargeTitle: false,
                textChanged: () {},
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView.builder(
                      itemCount: dataSource.length,
                      itemBuilder: (context, index) {
                        return SubCategoryCell(model: dataSource[index]);
                      }),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}

class SubCategoryCell extends StatelessWidget {
  final SubCategoryModel model;

  SubCategoryCell({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.title,
        ),
        Row(
          children: [
            Text("${model.price}"),
            Text("${model.currency} / ${model.unit}"),
          ],
        )
      ],
    );
  }
}
