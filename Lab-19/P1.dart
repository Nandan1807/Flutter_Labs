import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entry Screen Example',
      home: EntryScreen(),
    );
  }
}

class EntryScreen extends StatefulWidget {
  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool isLoading = false;

  Future<void> saveData() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse('https://example.com/save_data'),
      body: {
        'name': nameController.text,
        'dob': dobController.text,
        'city': cityController.text,
        'address': addressController.text,
      },
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      // Data saved successfully
      _showSnackBar('Data saved successfully');
    } else {
      // Error saving data
      _showSnackBar('Error saving data. Please try again.');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entry Screen'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: dobController,
                    decoration: InputDecoration(labelText: 'DOB'),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: cityController,
                    decoration: InputDecoration(labelText: 'City'),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: addressController,
                    decoration: InputDecoration(labelText: 'Address'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      saveData();
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
    );
  }
}
