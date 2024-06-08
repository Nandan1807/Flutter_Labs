import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text on Image'),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Image.asset('assets/image.jpg'),
              Positioned(
                bottom: 10,
                right: 10,
                child: Text(
                  'Hello World',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
