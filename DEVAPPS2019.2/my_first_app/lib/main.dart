import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class RowModel {
  String title;
  String subtitle;
  String detail;

  RowModel({this.title, this.subtitle, this.detail});
}

class CustomRow extends StatelessWidget {
  final RowModel model;

  CustomRow({this.model});

  build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title,
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
            Text(
              model.subtitle,
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ],
        ),
        Text(
          model.detail,
          style: TextStyle(color: Colors.red, fontSize: 30),
        )
      ],
    );
  }
}

class MyApp2 extends StatelessWidget {
  final dataSource = [
    RowModel(title: "Grocery", subtitle: "Grocery", detail: "40 reais"),
    RowModel(title: "Grocery 1", subtitle: "Grocery", detail: "40 reais"),
    RowModel(title: "Grocery 2", subtitle: "Grocery", detail: "40 reais"),
    RowModel(title: "Grocery 3", subtitle: "Grocery", detail: "40 reais"),
    RowModel(title: "Grocery 4", subtitle: "Grocery", detail: "40 reais"),
    RowModel(title: "Grocery 5", subtitle: "Grocery", detail: "40 reais"),
  ];

  build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: dataSource
          .map((model) => CustomRow(
                model: model,
              ))
          .toList(),
    )));
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Testing'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
