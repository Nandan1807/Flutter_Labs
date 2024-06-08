import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await openDatabase(
      'path/to/your/database.db',
      onCreate: (db, version) {
        // Create tables if they don't exist
        db.execute('''
          CREATE TABLE IF NOT EXISTS tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            task_name TEXT,
            due_date TEXT,
            status TEXT
          )
        ''');
      },
      version: 1,
    );

    return _database!;
  }

  Future<void> insertTask(String taskName) async {
    final db = await database;
    await db.insert(
      'tasks',
      {
        'task_name': taskName,
        // Add other columns as needed
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

class ToDoInsertScreen extends StatefulWidget {
  @override
  _ToDoInsertScreenState createState() => _ToDoInsertScreenState();
}

class _ToDoInsertScreenState extends State<ToDoInsertScreen> {
  final _formKey = GlobalKey<FormState>();
  String _taskName = '';

  final dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add To-Do'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Task Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _taskName = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Save the data to the database
                    await dbHelper.insertTask(_taskName);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
