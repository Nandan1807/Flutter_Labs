import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _validateEmail = false;
  bool _validatePassword = false;

  void _register() {
    setState(() {
      _validateEmail = _emailController.text.isEmpty ||
          !_emailController.text.contains('@');
      _validatePassword = _passwordController.text.isEmpty ||
          _passwordController.text.length < 6;
    });

    if (!_validateEmail && !_validatePassword) {
      // Perform registration logic
      print('Registration successful!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                labelText: 'Email',
                errorText: _validateEmail ? 'Invalid email' : null,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                labelText: 'Password',
                errorText: _validatePassword ? 'Invalid password' : null,
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: _register,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
