import 'package:delivery_app/common/app_colors/app_colors.dart';
import 'package:delivery_app/common/components/default_background/default_background.dart';
import 'package:delivery_app/common/components/default_navigation/default_navigation.dart';
import 'package:delivery_app/common/components/search_text_field/search_text_field.dart';
import 'package:delivery_app/common/styles/styles.dart';
import 'package:delivery_app/features/cart_page/cart_page.dart';
import 'package:delivery_app/features/favorites_page/favorites_page.dart';
import 'package:delivery_app/features/food_page/food_view_model.dart';
import 'package:delivery_app/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  final FoodViewModelInterface viewModel;

  FoodPage({this.viewModel});

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  void initState() {
    super.initState();

    widget.viewModel.navigateToFavorites = () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FavoritesPage()));
    };

    widget.viewModel.navigateToCart = () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CartPage()));
    };
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
              DefaultNavigation(text: widget.viewModel.category.title),
              SizedBox(height: 24),
              SearchTextField(),
              SizedBox(height: 8),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    itemCount: widget.viewModel.category.items.length,
                    itemBuilder: (context, index) {
                      return FoodListItem(
                          item: widget.viewModel.category.items[index],
                          didTapFavorites: () =>
                              widget.viewModel.didTapFavorites(),
                          didTapCart: () => widget.viewModel.didTapCart());
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
  final Function didTapFavorites;
  final Function didTapCart;

  const FoodListItem(
      {Key key, this.item, this.didTapFavorites, this.didTapCart})
      : super(key: key);

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
                        onPressed: () {
                          if (didTapFavorites != null) {
                            didTapFavorites();
                          }
                        },
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
                        onPressed: () {
                          if (didTapCart != null) {
                            didTapCart();
                          }
                        },
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
