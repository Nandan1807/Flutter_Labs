import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('9 Different Size Parts')),
        body: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(child: Container(color: Colors.grey)),
                  Expanded(flex:2,child: Container(color: Colors.orange)),
                  Expanded(flex:2,child: Container(color: Colors.blue)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(flex:3,child: Container(color: Colors.redAccent)),
                  Expanded(flex:3,child: Container(color: Colors.green)),
                  Expanded(child: Container(color: Colors.indigo)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.red)),
                  Expanded(flex:2,child: Container(color: Colors.yellow)),
                  Expanded(flex:3,child: Container(color: Colors.purple)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
