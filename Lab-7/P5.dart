import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Print TextField Value')),
        body: PrintTextFieldValue(),
      ),
    );
  }
}

class PrintTextFieldValue extends StatefulWidget {
  @override
  _PrintTextFieldValueState createState() => _PrintTextFieldValueState();
}

class _PrintTextFieldValueState extends State<PrintTextFieldValue> {
  final TextEditingController _controller = TextEditingController();
  String _displayText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Enter something'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _displayText = _controller.text;
              });
            },
            child: Text('Display Text'),
          ),
          SizedBox(height: 20),
          Text(_displayText),
        ],
      ),
    );
  }
}
