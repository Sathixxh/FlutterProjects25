import 'package:flutter/material.dart';


void main() async {
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Screenshot Prevention')),
        body: Center(child: Text('Screenshot prevention is enabled.')),
      ),
    );
  }
}