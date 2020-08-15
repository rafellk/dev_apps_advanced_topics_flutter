import 'package:delivery_app/common/app_colors/app_colors.dart';
import 'package:delivery_app/common/components/default_background/default_background.dart';
import 'package:delivery_app/common/components/default_navigation/default_navigation.dart';
import 'package:delivery_app/common/components/search_text_field/search_text_field.dart';
import 'package:delivery_app/common/styles/styles.dart';
import 'package:delivery_app/models/category.dart';
import 'package:delivery_app/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  final Category category;

  FoodPage({this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DefaultBackground(
            color: AppColors.defaultBackgroundColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultNavigation(text: "Vegetables"),
              SizedBox(height: 24),
              SearchTextField(),
              SizedBox(height: 8),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    itemCount: category.items.length,
                    itemBuilder: (context, index) {
                      return FoodListItem(item: category.items[index]);
                    }),
              ))
            ],
          ),
        ],
      ),
    );
  }
}

class FoodListItem extends StatelessWidget {
  final Item item;

  const FoodListItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageWidth = (MediaQuery.of(context).size.width - 60) / 2;
    var buttonWidth = (imageWidth - 20) / 2;

    return Container(
      padding: EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: imageWidth,
              height: imageWidth * 0.72,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.network(item.imageURL))),
          Container(
            width: imageWidth,
            height: imageWidth * 0.72,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.title, style: Styles.primaryText),
                Row(
                  children: [
                    Text(
                      "${item.price}",
                      style: Styles.bodyText,
                    ),
                    Text("\$ / ${item.unit}", style: Styles.secondaryText)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: buttonWidth,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                              color: AppColors.textFieldBorderColor, width: 1)),
                      child: IconButton(
                        color: AppColors.textSecondaryColor,
                        icon: Icon(CupertinoIcons.heart),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: buttonWidth,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: AppColors.primaryButtonColor,
                      ),
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(CupertinoIcons.shopping_cart),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
