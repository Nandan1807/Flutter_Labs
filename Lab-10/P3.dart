import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ActionBarDemo(),
        body: Center(child: Text('ActionBar Demo')),
      ),
    );
  }
}

class ActionBarDemo extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('ActionBar Demo'),
      actions: [
        PopupMenuButton(
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              child: Text("Menu Item 1"),
              value: "Menu Item 1",
            ),
            PopupMenuItem(
              child: Text("Menu Item 2"),
              value: "Menu Item 2",
            ),
          ],
          onSelected: (value) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Alert Dialog'),
                  content: Text('$value clicked!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
