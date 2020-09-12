import 'package:delivery_app/common/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.defaultBackgroundColor,
        child: Center(child: Text("Favorites")),
      ),
    );
  }
}
