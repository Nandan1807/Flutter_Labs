import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MatersialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Vertical Division')),
        body: Column(
          children: [
            Expanded(child: Container(color: Colors.red)),
            Expanded(child: Container(color: Colors.green)),
            Expanded(child: Container(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
