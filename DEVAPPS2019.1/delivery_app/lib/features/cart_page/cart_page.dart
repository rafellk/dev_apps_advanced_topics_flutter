import 'package:delivery_app/common/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryButtonColor,
        child: Center(
            child: Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
