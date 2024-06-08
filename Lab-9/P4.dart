import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BirthdayCard(),
    );
  }
}

class BirthdayCard extends StatelessWidget {
  final String recipient;
  final String message;

  BirthdayCard({this.recipient = 'Friend', this.message = 'Happy Birthday!'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday Card'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dear $recipient,',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/birthday_cake.jpg',
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
