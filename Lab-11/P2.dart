import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _validateEmail = false;
  bool _validatePassword = false;

  void _login() {
    setState(() {
      _validateEmail = _emailController.text.isEmpty ||
          !_emailController.text.contains('@');
      _validatePassword = _passwordController.text.isEmpty ||
          _passwordController.text.length < 6;
    });

    if (!_validateEmail && !_validatePassword) {
      // Perform login logic
      print('Login successful!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
