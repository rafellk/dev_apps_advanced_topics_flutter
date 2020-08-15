import 'package:delivery_app/common/app_colors/app_colors.dart';
import 'package:delivery_app/common/components/default_background/default_background.dart';
import 'package:delivery_app/common/components/default_navigation/default_navigation.dart';
import 'package:delivery_app/common/components/search_text_field/search_text_field.dart';
import 'package:delivery_app/common/styles/styles.dart';
import 'package:delivery_app/features/food_page/food_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
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
              DefaultNavigation(text: "Categories"),
              SizedBox(height: 24),
              SearchTextField(),
              SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        GridViewItem(
                          callback: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FoodPage()));
                          },
                        ),
                        GridViewItem(
                          callback: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FoodPage()));
                          },
                        ),
                        GridViewItem(
                          callback: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FoodPage()));
                          },
                        ),
                        GridViewItem(
                          callback: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FoodPage()));
                          },
                        ),
                        GridViewItem(
                          callback: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FoodPage()));
                          },
                        ),
                        GridViewItem(
                          callback: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FoodPage()));
                          },
                        ),
                        GridViewItem(
                          callback: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FoodPage()));
                          },
                        ),
                      ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class GridViewItem extends StatelessWidget {
  final String imageURL;
  final String title;
  final String quantity;
  final Function callback;

  const GridViewItem(
      {Key key, this.imageURL, this.title, this.quantity, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.textFieldBorderColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: Image.asset(
                    "resources/images/categories_image.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Vegetables", style: Styles.primaryText),
                  SizedBox(height: 8),
                  Text("(22)", style: Styles.footerText),
                  SizedBox(height: 8),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
