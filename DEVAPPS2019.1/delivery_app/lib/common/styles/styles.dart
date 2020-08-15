import 'package:delivery_app/common/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class Styles {
  static TextStyle headerText = TextStyle(
      color: AppColors.textPrimaryColor,
      fontSize: 32,
      fontWeight: FontWeight.bold);

  static TextStyle primaryText = TextStyle(
      color: AppColors.textPrimaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold);

  static TextStyle bodyText = TextStyle(
      color: AppColors.textPrimaryColor,
      fontSize: 22,
      fontWeight: FontWeight.bold);

  static TextStyle secondaryText =
      TextStyle(color: AppColors.textSecondaryColor, fontSize: 16);

  static TextStyle footerText =
      TextStyle(color: AppColors.textSecondaryColor, fontSize: 12);

  static TextStyle primaryButtonText =
      TextStyle(color: Colors.white, fontSize: 16);

  static TextStyle secondaryButtonText = TextStyle(
      color: AppColors.textSecondaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w500);
}
