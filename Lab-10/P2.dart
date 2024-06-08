import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationDrawerDemo(),
    );
  }
}

class NavigationDrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Drawer Demo'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Page 1'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));
              },
            ),
            ListTile(
              title: Text('Page 2'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));
              },
            ),
            ListTile(
              title: Text('Page 3'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page3()));
              },
            ),
          ],
        ),
      ),
      body: Center(child: Text('Home Page')),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(child: Text('Page 1')),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(child: Text('Page 2')),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: Center(child: Text('Page 3')),
    );
  }
}
