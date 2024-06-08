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
  TextEditingController _passwordController = TextEditingController();

  bool _validatePassword = false;
  bool _obscureText = true;

  void _register() {
    setState(() {
      _validatePassword =
          _passwordController.text.isEmpty || _passwordController.text.length < 6;
    });

    if (!_validatePassword) {
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
              obscureText: _obscureText,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                labelText: 'Password',
                errorText: _validatePassword ? 'Invalid password' : null,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
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
