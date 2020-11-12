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
  bool isFavorite;
  String imageName;

  SubCategoryModel(
      {this.title,
      this.price,
      this.currency,
      this.unit,
      this.isFavorite,
      this.imageName});
}

class SubCategoryPage extends StatelessWidget {
  final CategoryModel model;
  final List<SubCategoryModel> dataSource = [
    SubCategoryModel(
        title: "Boston Lettuce",
        price: 1.10,
        currency: "€",
        unit: "piece",
        isFavorite: false,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Purple Cauliflower",
        price: 1.85,
        currency: "€",
        unit: "kg",
        isFavorite: true,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Boston Lettuce",
        price: 1.10,
        currency: "€",
        unit: "piece",
        isFavorite: false,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Purple Cauliflower",
        price: 1.85,
        currency: "€",
        unit: "kg",
        isFavorite: true,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Boston Lettuce",
        price: 1.10,
        currency: "€",
        unit: "piece",
        isFavorite: false,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Purple Cauliflower",
        price: 1.85,
        currency: "€",
        unit: "kg",
        isFavorite: true,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Boston Lettuce",
        price: 1.10,
        currency: "€",
        unit: "piece",
        isFavorite: false,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Purple Cauliflower",
        price: 1.85,
        currency: "€",
        unit: "kg",
        isFavorite: true,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Boston Lettuce",
        price: 1.10,
        currency: "€",
        unit: "piece",
        isFavorite: false,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Purple Cauliflower",
        price: 1.85,
        currency: "€",
        unit: "kg",
        isFavorite: true,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Boston Lettuce",
        price: 1.10,
        currency: "€",
        unit: "piece",
        isFavorite: false,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Purple Cauliflower",
        price: 1.85,
        currency: "€",
        unit: "kg",
        isFavorite: true,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Boston Lettuce",
        price: 1.10,
        currency: "€",
        unit: "piece",
        isFavorite: false,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Purple Cauliflower",
        price: 1.85,
        currency: "€",
        unit: "kg",
        isFavorite: true,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Boston Lettuce",
        price: 1.10,
        currency: "€",
        unit: "piece",
        isFavorite: false,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Purple Cauliflower",
        price: 1.85,
        currency: "€",
        unit: "kg",
        isFavorite: true,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Boston Lettuce",
        price: 1.10,
        currency: "€",
        unit: "piece",
        isFavorite: false,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Purple Cauliflower",
        price: 1.85,
        currency: "€",
        unit: "kg",
        isFavorite: true,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Boston Lettuce",
        price: 1.10,
        currency: "€",
        unit: "piece",
        isFavorite: false,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Purple Cauliflower",
        price: 1.85,
        currency: "€",
        unit: "kg",
        isFavorite: true,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Boston Lettuce",
        price: 1.10,
        currency: "€",
        unit: "piece",
        isFavorite: false,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Purple Cauliflower",
        price: 1.85,
        currency: "€",
        unit: "kg",
        isFavorite: true,
        imageName: "images/subcategory_placeholder.png"),
    SubCategoryModel(
        title: "Savoy Cabbage",
        price: 1.45,
        currency: "€",
        unit: "g",
        isFavorite: true,
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

enum SubCategoryTextSize { small, medium, large }

class SubCategoryCell extends StatelessWidget {
  final SubCategoryModel model;

  SubCategoryCell({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
              height: 110,
              width: 110 * 1.3828125,
              child: Image.asset("images/subcategory_placeholder.png")),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createText(data: model.title, size: SubCategoryTextSize.medium),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  _createText(
                      data: "${model.price}", size: SubCategoryTextSize.large),
                  SizedBox(
                    width: 2,
                  ),
                  _createText(
                      data: "${model.currency} / ${model.unit}",
                      size: SubCategoryTextSize.small),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 40,
                    width: 60,
                    child: Image.asset(
                        "images/${model.isFavorite ? "is_favorite" : "non_favorite"}.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 60,
                    child: Image.asset("images/cart.png"),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  _createText({String data, SubCategoryTextSize size}) {
    TextStyle style;

    switch (size) {
      case SubCategoryTextSize.small:
        style = TextStyle(fontSize: 16, color: AppColors.secondaryTextColor);
        break;
      case SubCategoryTextSize.medium:
        style = TextStyle(
            fontSize: 18,
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.w500);
        break;
      case SubCategoryTextSize.large:
        style = TextStyle(
            fontSize: 22,
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.bold);
        break;
    }

    return Text(data, style: style);
  }
}
