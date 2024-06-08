import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Task {
  final int id;
  final String name;
  final String priority;

  Task({required this.id, required this.name, required this.priority});
}

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
            priority TEXT
          )
        ''');
      },
      version: 1,
    );

    return _database!;
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        name: maps[i]['task_name'],
        priority: maps[i]['priority'],
      );
    });
  }

  Future<void> sortByAZ() async {
    final db = await database;
    await db.rawQuery('''
      SELECT * FROM tasks ORDER BY task_name ASC
    ''');
  }

  Future<void> sortByZA() async {
    final db = await database;
    await db.rawQuery('''
      SELECT * FROM tasks ORDER BY task_name DESC
    ''');
  }
}

class TaskListView extends StatefulWidget {
  @override
  _TaskListViewState createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  final dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: () {
              _sortTasksByAZ();
            },
          ),
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: () {
              _sortTasksByZA();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Task>>(
        future: dbHelper.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final task = snapshot.data![index];
                Color color;
                switch (task.priority) {
                  case 'High':
                    color = Colors.red;
                    break;
                  case 'Medium':
                    color = Colors.orange;
                    break;
                  case 'Low':
                    color = Colors.green;
                    break;
                  default:
                    color = Colors.grey;
                }
                return ListTile(
                  title: Text(task.name),
                  leading: CircleAvatar(
                    backgroundColor: color,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  void _sortTasksByAZ() async {
    await dbHelper.sortByAZ();
    setState(() {});
  }

  void _sortTasksByZA() async {
    await dbHelper.sortByZA();
    setState(() {});
  }
}
