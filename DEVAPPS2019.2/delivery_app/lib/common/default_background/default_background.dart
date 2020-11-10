import 'package:delivery_app/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.onboardingBackgroundColor,
        ),
        Image.asset("images/onboarding_background_image.png"),
      ],
    );
  }
}
