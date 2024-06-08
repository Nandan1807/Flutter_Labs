import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationSelectionPage extends StatefulWidget {
  @override
  _LocationSelectionPageState createState() => _LocationSelectionPageState();
}

class _LocationSelectionPageState extends State<LocationSelectionPage> {
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;

  List<String> countries = [];
  List<String> states = [];
  List<String> cities = [];

  Future<void> fetchCountries() async {
    final response = await http.get(Uri.parse('https://api.example.com/countries'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        countries = data.map((country) => country['name']).toList();
      });
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<void> fetchStates(String country) async {
    final response = await http.get(Uri.parse('https://api.example.com/states?country=$country'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        states = data.map((state) => state['name']).toList();
      });
    } else {
      throw Exception('Failed to load states');
    }
  }

  Future<void> fetchCities(String state) async {
    final response = await http.get(Uri.parse('https://api.example.com/cities?state=$state'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        cities = data.map((city) => city['name']).toList();
      });
    } else {
      throw Exception('Failed to load cities');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: selectedCountry,
              hint: Text('Select Country'),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value;
                  selectedState = null;
                  selectedCity = null;
                });
                fetchStates(value!);
              },
              items: countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedState,
              hint: Text('Select State'),
              onChanged: (value) {
                setState(() {
                  selectedState = value;
                  selectedCity = null;
                });
                fetchCities(value!);
              },
              items: states.map((state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedCity,
              hint: Text('Select City'),
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
              items: cities.map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
