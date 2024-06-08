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
      title: 'Nested API Example',
      home: NestedAPIExample(),
    );
  }
}

class NestedAPIExample extends StatefulWidget {
  @override
  _NestedAPIExampleState createState() => _NestedAPIExampleState();
}

class _NestedAPIExampleState extends State<NestedAPIExample> {
  String selectedCategory = '';
  String selectedSubcategory = '';
  String selectedType = '';
  List<String> categories = [];
  List<String> subcategories = [];
  List<String> types = [];

  Future<void> fetchCategories() async {
    final response = await http.get(Uri.parse('https://api.example.com/categories'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        categories = data.map((e) => e['name']).toList();
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<void> fetchSubcategories(String category) async {
    final response = await http.get(Uri.parse('https://api.example.com/categories/$category/subcategories'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        subcategories = data.map((e) => e['name']).toList();
      });
    } else {
      throw Exception('Failed to load subcategories');
    }
  }

  Future<void> fetchTypes(String category, String subcategory) async {
    final response = await http.get(Uri.parse('https://api.example.com/categories/$category/subcategories/$subcategory/types'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        types = data.map((e) => e['name']).toList();
      });
    } else {
      throw Exception('Failed to load types');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nested API Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedCategory,
              hint: Text('Select Category'),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                  fetchSubcategories(selectedCategory);
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedSubcategory,
              hint: Text('Select Subcategory'),
              onChanged: (value) {
                setState(() {
                  selectedSubcategory = value!;
                  fetchTypes(selectedCategory, selectedSubcategory);
                });
              },
              items: subcategories.map<DropdownMenuItem<String>>((String subcategory) {
                return DropdownMenuItem<String>(
                  value: subcategory,
                  child: Text(subcategory),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedType,
              hint: Text('Select Type'),
              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                });
              },
              items: types.map<DropdownMenuItem<String>>((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
