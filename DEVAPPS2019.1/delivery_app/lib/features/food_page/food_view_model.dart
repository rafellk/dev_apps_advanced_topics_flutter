import 'package:delivery_app/models/category.dart';

abstract class FoodViewModelInterface {
  // Variables
  Category category;
  Function navigateToFavorites;
  Function navigateToCart;

  // Methods
  didTapFavorites();
  didTapCart();
}

class FoodViewModel implements FoodViewModelInterface {
  Category category;
  Function navigateToCart;
  Function navigateToFavorites;

  FoodViewModel({this.category});

  didTapCart() {
    navigateToCart();
  }

  didTapFavorites() {
    navigateToFavorites();
  }
}
