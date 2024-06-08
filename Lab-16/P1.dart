import 'package:flutter/material.dart';
import 'dart:convert';

class DataModel {
  final String name;
  final int age;

  DataModel({required this.name, required this.age});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'],
      age: json['age'],
    );
  }
}

class JsonParsingPage extends StatefulWidget {
  @override
  _JsonParsingPageState createState() => _JsonParsingPageState();
}

class _JsonParsingPageState extends State<JsonParsingPage> {
  List<DataModel> data = [];

  Future<void> fetchData() async {
    String jsonString = await DefaultAssetBundle.of(context).loadString('assets/data.json');
    final jsonData = jsonDecode(jsonString);
    setState(() {
      data = (jsonData as List).map((e) => DataModel.fromJson(e)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Parsing Example'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Age: ${item.age}'),
          );
        },
      ),
    );
  }
}

// [
//   {
//     "name": "John",
//     "age": 30
//   },
//   {
//     "name": "Alice",
//     "age": 25
//   }
// ]

// To use this code, add the quicktype_core package to your pubspec.yaml file
// dependencies:
//   quicktype_core: any

// Then, run the following command to generate the code:
// quicktype --json input.json --dart

import 'dart:convert';

List<DataModel> dataModelFromJson(String str) => List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
    DataModel({
        required this.name,
        required this.age,
    });

    String name;
    int age;

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        name: json["name"],
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
    };
}

