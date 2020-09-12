import 'dart:convert';

import 'package:delivery_app/models/category.dart';
import 'package:delivery_app/services/service.dart';

class CategoriesAdapter {
  String title;
  bool isLoading;
  List<Category> categories;
  bool inError;

  CategoriesAdapter(
      {this.title, this.isLoading, this.categories, this.inError});
}

abstract class CategoriesViewModelInterface {
  // Variables
  CategoriesAdapter adapter;
  Function didUpdate;
  ServiceInterface service;

  // Methods
  fetchCategories();
}

class CategoriesViewModel implements CategoriesViewModelInterface {
  // Variables
  CategoriesAdapter adapter = CategoriesAdapter(
      title: "Categories", isLoading: false, categories: [], inError: false);
  Function didUpdate;
  ServiceInterface service;

  CategoriesViewModel({this.service});

  // Methods
  fetchCategories() async {
    adapter.isLoading = true;
    if (didUpdate != null) {
      didUpdate(adapter);
    }

    return service.getCategories().then((response) {
      var json = jsonDecode(response.body)["categories"];
      adapter.categories = [];

      for (var categoryJson in json) {
        adapter.categories.add(Category.fromJson(categoryJson));
      }

      adapter.isLoading = false;
      adapter.inError = false;

      if (didUpdate != null) {
        didUpdate(adapter);
      }
    }).catchError((error) {
      adapter.inError = true;
      if (didUpdate != null) {
        didUpdate(adapter);
      }
    });
  }
}
