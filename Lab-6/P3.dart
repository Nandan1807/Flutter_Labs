import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('9 Equal Parts')),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.red)),
                  Expanded(child: Container(color: Colors.green)),
                  Expanded(child: Container(color: Colors.blue)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.brown)),
                  Expanded(child: Container(color: Colors.lightBlue)),
                  Expanded(child: Container(color: Colors.purple)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.black)),
                  Expanded(child: Container(color: Colors.redAccent)),
                  Expanded(child: Container(color: Colors.orange)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
