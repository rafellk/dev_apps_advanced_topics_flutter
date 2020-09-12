import 'dart:convert';

import 'package:delivery_app/common/app_colors/app_colors.dart';
import 'package:delivery_app/common/components/default_background/default_background.dart';
import 'package:delivery_app/common/components/default_navigation/default_navigation.dart';
import 'package:delivery_app/common/components/search_text_field/search_text_field.dart';
import 'package:delivery_app/common/styles/styles.dart';
import 'package:delivery_app/features/categories_page/categories_view_model.dart';
import 'package:delivery_app/features/food_page/food_page.dart';
import 'package:delivery_app/features/food_page/food_view_model.dart';
import 'package:delivery_app/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesViewModelInterface viewModel;

  CategoriesPage({this.viewModel});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  CategoriesAdapter adapter;

  @override
  void initState() {
    super.initState();
    adapter = widget.viewModel.adapter;

    widget.viewModel.didUpdate = (adapter) {
      setState(() {
        this.adapter = adapter;
      });
    };

    widget.viewModel.fetchCategories();
  }

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
              DefaultNavigation(text: adapter.title),
              SizedBox(height: 24),
              SearchTextField(),
              SizedBox(height: 8),
              adapter.categories.isEmpty
                  ? SizedBox.shrink()
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            children: adapter.categories
                                .map((category) => GridViewItem(
                                      category: category,
                                      callback: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => FoodPage(
                                                      viewModel: FoodViewModel(
                                                          category: category),
                                                    )));
                                      },
                                    ))
                                .toList()),
                      ),
                    ),
            ],
          ),
          adapter.isLoading
              ? Center(child: CupertinoActivityIndicator())
              : SizedBox.shrink()
        ],
      ),
    );
  }

  // _fetchCategories() {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   Service.getCategories().then((response) {
  //     var json = jsonDecode(response.body)["categories"];

  //     categories = [];
  //     for (var categoryJson in json) {
  //       categories.add(Category.fromJson(categoryJson));
  //     }

  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  // }
}

class GridViewItem extends StatelessWidget {
  final Category category;
  final Function callback;

  const GridViewItem({Key key, this.category, this.callback}) : super(key: key);

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
                  child: Image.network(category.imageURL)),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category.title, style: Styles.primaryText),
                  SizedBox(height: 8),
                  Text("(${category.items.length})", style: Styles.footerText),
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
