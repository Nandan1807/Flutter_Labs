import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Task {
  final int id;
  final String name;

  Task({required this.id, required this.name});
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
            task_name TEXT
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
      );
    });
  }

  Future<void> updateTask(Task task) async {
    final db = await database;
    await db.update(
      'tasks',
      {'task_name': task.name},
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }
}

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: FutureBuilder<List<Task>>(
        future: dbHelper.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final task = snapshot.data![index];
                return ListTile(
                  title: Text(task.name),
                  onTap: () {
                    _navigateToEditPage(context, task);
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _showDeleteConfirmation(context, task);
                    },
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

  void _navigateToEditPage(BuildContext context, Task task) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTaskPage(task: task),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, Task task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this task?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Delete"),
              onPressed: () {
                _deleteTask(context, task);
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteTask(BuildContext context, Task task) async {
    final db = await dbHelper.database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [task.id]);
    setState(() {});
    Navigator.of(context).pop();
  }
}

class EditTaskPage extends StatefulWidget {
  final Task task;

  EditTaskPage({required this.task});

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.task.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _updateTask();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateTask() {
    final updatedTask = Task(id: widget.task.id, name: _controller.text);
    DBHelper().updateTask(updatedTask);
    Navigator.pop(context);
  }
}
