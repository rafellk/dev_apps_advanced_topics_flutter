import 'package:flutter/material.dart';

class DefaultBackground extends StatelessWidget {
  final Color color;
  final String imageName;

  DefaultBackground({this.color, this.imageName});

  build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: color,
        ),
        imageName != null
            ? Image.asset("images/$imageName.png")
            : SizedBox.shrink(),
      ],
    );
  }
}
