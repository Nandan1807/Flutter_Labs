import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dice Roller'),
        ),
        body: Center(
          child: DiceRoller(),
        ),
      ),
    );
  }
}

class DiceRoller extends StatefulWidget {
  @override
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int diceNumber = 1;

  void rollDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You rolled: $diceNumber',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        RaisedButton(
          onPressed: rollDice,
          child: Text('Roll Dice'),
        ),
      ],
    );
  }
}
