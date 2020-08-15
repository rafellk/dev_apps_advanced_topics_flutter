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
            itemCount: dataSource.length + 1,
            itemBuilder: (context, index) {
              if (index == dataSource.length) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Card(
                    color: Colors.redAccent,
                    child: Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          "Sign Out",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              }
              var value = dataSource[index];
              return Card(
                child: ListTile(
                  title: Text(value),
                ),
              );
            }));
  }
}
