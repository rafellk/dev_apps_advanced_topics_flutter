import 'dart:async';

import 'package:FirstFlutterProject/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class SignInModel {
  String username;
  String password;
  bool rememberMe;

  SignInModel({this.username, this.password, this.rememberMe});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainAppWidget(),
    );
  }
}

class MainAppWidget extends StatefulWidget {
  MainAppWidget({Key key}) : super(key: key);

  @override
  _MainAppWidgetState createState() => _MainAppWidgetState();
}

class _MainAppWidgetState extends State<MainAppWidget> {
  var model = SignInModel(username: "", password: "", rememberMe: false);
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing"),
      ),
      body: Stack(
        children: [
          DefaultBackground(),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(24),
              child: SignInWidget(
                model: model,
                callback: (model) {
                  this.model = model;

                  setState(() {
                    isLoading = true;
                  });

                  Future.delayed(Duration(seconds: 3)).then((_) {
                    setState(() {
                      isLoading = false;
                    });

                    presentHomePage(context: context);
                  });
                },
              ),
            ),
          ),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : SizedBox.shrink()
        ],
      ),
    );
  }

  presentHomePage({BuildContext context}) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePage(
              model: model,
            )));
  }
}

class DefaultBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue.withOpacity(0.1));
  }
}

class SignInWidget extends StatefulWidget {
  final Function callback;
  SignInModel model;

  SignInWidget({this.callback, this.model});

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleImage(
          height: 150,
          imageName: "resources/images/flutter_logo.png",
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
              helperText: "Enter a valid username", hintText: "Username"),
          onChanged: (value) {
            widget.model.username = value;
          },
        ),
        SizedBox(height: 8),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
              helperText: "Enter a valid password", hintText: "Password"),
          onChanged: (value) {
            widget.model.password = value;
          },
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Remember me"),
                Checkbox(
                  value: widget.model.rememberMe,
                  onChanged: (value) {
                    setState(() {
                      widget.model.rememberMe = value;
                    });
                  },
                ),
              ],
            ),
            FlatButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.blue,
                    ),
                    Text("Don't have an account?",
                        style: TextStyle(color: Colors.blue)),
                  ],
                ))
          ],
        ),
        SizedBox(height: 24),
        Container(
          width: double.infinity,
          child: FlatButton(
            onPressed: () {
              widget.callback(widget.model);
            },
            child: Text("Sign In", style: TextStyle(color: Colors.white)),
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}

class CircleImage extends StatelessWidget {
  final double height;
  final String imageName;

  CircleImage({this.height, this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height,
      height: height,
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(imageName)),
          borderRadius: BorderRadius.all(Radius.circular(height / 2))),
    );
  }
}

class ColumnListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("description"),
                  SizedBox(
                    height: 8,
                  ),
                  TextField()
                ],
              ),
              Text("Testing")
            ],
          ),
          // Center(
          //   child: CupertinoActivityIndicator(),
          // )
        ],
      ),
    );
  }
}

class DefaultText extends StatelessWidget {
  final String text;

  DefaultText({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 45, color: Colors.blue));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 34;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
