import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

// starting point
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello flutter!'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Hello world!'),
        ),
      ),
    );
  }
}