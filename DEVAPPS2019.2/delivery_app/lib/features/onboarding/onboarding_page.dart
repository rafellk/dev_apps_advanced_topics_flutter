import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("images/contact_delivery_icon.png"),
            SizedBox(height: 24),
            createText(data: "Non Contact Deliveries", isSmall: false),
            SizedBox(height: 24),
            createText(
                data:
                    "When placing an order, select an option \"Contactless delivery\" and the courier will leave your order at door",
                isSmall: true),
            SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(onPressed: () {}, child: Text("ORDER NOW")),
                FlatButton(onPressed: () {}, child: Text("DISMISS")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Text createText({String data, bool isSmall}) {
    var textStyle = TextStyle(fontSize: 16);

    if (!isSmall) {
      textStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    }

    return Text(
      data,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }
}
