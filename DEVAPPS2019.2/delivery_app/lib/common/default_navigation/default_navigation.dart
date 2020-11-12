import 'package:delivery_app/common/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultNavigation extends StatelessWidget {
  final String title;
  final String placeholder;
  final bool isLargeTitle;
  final Function textChanged;

  DefaultNavigation(
      {this.title,
      this.placeholder,
      this.isLargeTitle = true,
      this.textChanged});

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
                  fontSize: isLargeTitle ? 30 : 26,
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SearchTextField(
            placeholder: "Search",
          ),
        )
      ],
    );
  }
}

class SearchTextField extends StatelessWidget {
  final Function textChanged;
  final String placeholder;

  SearchTextField({this.placeholder, this.textChanged});

  build(BuildContext context) {
    return Container(
        height: 48,
        child: CupertinoTextField(
          prefix: Padding(
            padding: EdgeInsets.only(left: 20, right: 16),
            child: Image.asset("images/search.png"),
          ),
          placeholder: placeholder,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(27), right: Radius.circular(27)),
              border: Border.all(
                  color: AppColors.defaultTextFieldBorderColor, width: 1)),
        ));
  }
}
