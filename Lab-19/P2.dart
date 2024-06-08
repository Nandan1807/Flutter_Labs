  // dependencies:
  //   flutter:
  //     sdk: flutter
  //   provider: ^5.0.0
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Screen Example',
      home: ChangeNotifierProvider(
        create: (context) => DataProvider(),
        child: ListScreen(),
      ),
    );
  }
}

class DataProvider extends ChangeNotifier {
  List<String> dataList = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://example.com/fetch_data'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      dataList = data.map((item) => item.toString()).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> refreshData() async {
    await fetchData();
  }
}

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Provider.of<DataProvider>(context, listen: false).refreshData();
            },
          ),
        ],
      ),
      body: Consumer<DataProvider>(
        builder: (context, dataProvider, _) {
          if (dataProvider.dataList.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: dataProvider.dataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dataProvider.dataList[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
