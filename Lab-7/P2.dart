import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Custom Text Widget')),
        body: Center(
          child: CustomText('Hello Custom World'),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;

  CustomText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto', // Make sure the font is added in pubspec.yaml
        fontSize: 24,
        color: Colors.green,
      ),
    );
  }
}
