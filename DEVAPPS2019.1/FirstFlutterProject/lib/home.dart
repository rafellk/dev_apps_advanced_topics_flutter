import 'package:FirstFlutterProject/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  SignInModel model;
  List<String> dataSource;

  HomePage({this.model}) {
    dataSource = [
      "Username: ${model.username}",
      "Password: ${model.password}",
      "Remember Me: ${model.rememberMe.toString()}"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: ListView.builder(
            itemCount: dataSource.length,
            itemBuilder: (context, index) {
              var value = dataSource[index];
              return ListTile(
                title: Text(value),
              );
            }));
  }
}
