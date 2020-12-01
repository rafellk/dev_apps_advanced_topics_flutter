import 'package:delivery_app/common/datasource/datasource.dart';
import 'package:delivery_app/common/default_background/default_background.dart';
import 'package:delivery_app/common/default_navigation/default_navigation.dart';
import 'package:delivery_app/common/utils/app_colors.dart';
import 'package:delivery_app/features/home/home_page.dart';
import 'package:delivery_app/features/item_description/item_description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemModel {
  String title;
  double price;
  String currency;
  String unit;
  bool isFavorite;
  List<String> imageNames;
  String originalCountry;
  String fullDescription;
  String extraInformation;

  ItemModel(
      {this.title,
      this.price,
      this.currency,
      this.unit,
      this.isFavorite,
      this.imageNames,
      this.fullDescription,
      this.extraInformation,
      this.originalCountry});
}

class SubCategoryPage extends StatelessWidget {
  final CategoryModel model;

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
                      itemCount: DataSource.models.length,
                      itemBuilder: (context, index) {
                        var model = DataSource.models[index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ItemDescriptionPage(
                                        model: model,
                                      )));
                            },
                            child: SubCategoryCell(model: model));
                      }),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  Future<void> _showiOSAddToCartDialog({BuildContext context}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Success"),
          content: Text("The item was added to the cart!!!"),
          actions: [
            CupertinoDialogAction(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}

enum SubCategoryTextSize { small, medium, large }

class SubCategoryCell extends StatefulWidget {
  ItemModel model;

  SubCategoryCell({@required this.model});

  @override
  _SubCategoryCellState createState() => _SubCategoryCellState();
}

class _SubCategoryCellState extends State<SubCategoryCell> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
              height: 110,
              width: 110 * 1.3828125,
              child: Image.asset(widget.model.imageNames.first)),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createText(
                  data: widget.model.title, size: SubCategoryTextSize.medium),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  _createText(
                      data: "${widget.model.price}",
                      size: SubCategoryTextSize.large),
                  SizedBox(
                    width: 2,
                  ),
                  _createText(
                      data: "${widget.model.currency} / ${widget.model.unit}",
                      size: SubCategoryTextSize.small),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.model.isFavorite = !widget.model.isFavorite;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 60,
                      child: Image.asset(
                          "images/${widget.model.isFavorite ? "is_favorite" : "non_favorite"}.png"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showiOSAddToCartDialog(context: context);
                    },
                    child: Container(
                      height: 40,
                      width: 60,
                      child: Image.asset("images/cart.png"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showiOSAddToCartDialog({BuildContext context}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Success"),
          content: Text("The item was added to the cart!!!"),
          actions: [
            CupertinoDialogAction(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
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
