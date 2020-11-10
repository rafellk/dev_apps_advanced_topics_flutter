import 'package:delivery_app/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultNavigation extends StatelessWidget {
  final String title;
  final String placeholder;
  final Function textChanged;

  DefaultNavigation({this.title, this.placeholder, this.textChanged});

  build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          color: AppColors.primaryTextColor,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(title,
              style: TextStyle(
                  fontSize: 30,
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
