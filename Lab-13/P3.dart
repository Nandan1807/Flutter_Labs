import 'package:flutter/material.dart';

class LocationSelectionScreen extends StatefulWidget {
  @override
  _LocationSelectionScreenState createState() => _LocationSelectionScreenState();
}

class _LocationSelectionScreenState extends State<LocationSelectionScreen> {
  String _selectedCountry = '';
  String _selectedState = '';
  String _selectedCity = '';

  List<String> _countries = ['Country A', 'Country B', 'Country C'];
  Map<String, List<String>> _statesByCountry = {
    'Country A': ['State 1', 'State 2', 'State 3'],
    'Country B': ['State X', 'State Y', 'State Z'],
    'Country C': ['State Alpha', 'State Beta', 'State Gamma'],
  };
  Map<String, List<String>> _citiesByState = {
    'State 1': ['City A1', 'City A2', 'City A3'],
    'State 2': ['City B1', 'City B2', 'City B3'],
    'State 3': ['City C1', 'City C2', 'City C3'],
    // Add more cities as per your data
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Selection'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedCountry,
              hint: Text('Select Country'),
              items: _countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCountry = value!;
                  _selectedState = '';
                  _selectedCity = '';
                });
              },
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField<String>(
              value: _selectedState,
              hint: Text('Select State'),
              items: _statesByCountry[_selectedCountry]?.map((state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child: Text(state),
                );
              })?.toList() ?? [],
              onChanged: (value) {
                setState(() {
                  _selectedState = value!;
                  _selectedCity = '';
                });
              },
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField<String>(
              value: _selectedCity,
              hint: Text('Select City'),
              items: _citiesByState[_selectedState]?.map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              })?.toList() ?? [],
              onChanged: (value) {
                setState(() {
                  _selectedCity = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
