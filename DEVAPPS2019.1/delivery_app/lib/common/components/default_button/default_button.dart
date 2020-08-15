import 'package:delivery_app/common/app_colors/app_colors.dart';
import 'package:delivery_app/common/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DefaultButtonType { primary, secondary }

class DefaultButton extends StatelessWidget {
  final DefaultButtonType type;
  final Function callback;
  final String text;
  final bool isLarge;

  const DefaultButton(
      {this.type = DefaultButtonType.primary,
      this.callback,
      this.text = "",
      this.isLarge = true});

  @override
  Widget build(BuildContext context) {
    Color color;
    TextStyle style;

    switch (type) {
      case DefaultButtonType.primary:
        color = AppColors.primaryButtonColor;
        style = Styles.primaryButtonText;
        break;
      case DefaultButtonType.secondary:
        style = Styles.secondaryButtonText;
        color = Colors.transparent;
        break;
    }

    return Container(
      width: double.infinity,
      height: isLarge ? 56 : 32,
      child: CupertinoButton(
        onPressed: () {
          if (callback != null) {
            callback();
          }
        },
        color: color,
        child: Text(text, style: style),
      ),
    );
  }
}
