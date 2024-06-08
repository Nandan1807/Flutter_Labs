// To accomplish this task, you'll first need to create the necessary tables in SQLite for your to-do list app. Then, you'll attach the database file (.db) to your Flutter project. Here's a step-by-step guide:

// 1. **Create Tables in SQLite:**
//    You can create tables using SQL commands. For example:

//    ```sql
   CREATE TABLE tasks (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       task_name TEXT,
       due_date DATE,
       status TEXT
   );

   CREATE TABLE categories (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       category_name TEXT
   );

   CREATE TABLE task_categories (
       task_id INTEGER,
       category_id INTEGER,
       FOREIGN KEY(task_id) REFERENCES tasks(id),
       FOREIGN KEY(category_id) REFERENCES categories(id)
   );
   ```

  //  This creates three tables: `tasks`, `categories`, and `task_categories`. `task_categories` is a many-to-many relationship table linking tasks to categories.

// 2. **Attach .db File with Flutter Project:**
//    You can add the .db file to your Flutter project's assets folder and then access it within your code. In your `pubspec.yaml` file, include the .db file under the `assets` section:

//    ```yaml
   assets:
     - path/to/your/database.db
  //  ```

  //  Ensure you run `flutter pub get` after modifying the `pubspec.yaml` file to include the new asset.

// 3. **Use DB Queries:**
//    To perform database queries in Flutter, you can use the `sqflite` package. You can perform various queries like selecting all data, selecting data using joins, etc.

//    ```dart
   import 'package:sqflite/sqflite.dart';

   Future<void> fetchAllData() async {
     Database db = await openDatabase('path/to/your/database.db');
     List<Map<String, dynamic>> tasks = await db.rawQuery('SELECT * FROM tasks');
     print(tasks);
   }

   Future<void> fetchDataUsingJoin() async {
     Database db = await openDatabase('path/to/your/database.db');
     List<Map<String, dynamic>> result = await db.rawQuery('''
       SELECT tasks.*, categories.category_name 
       FROM tasks 
       INNER JOIN task_categories ON tasks.id = task_categories.task_id 
       INNER JOIN categories ON task_categories.category_id = categories.id
     ''');
     print(result);
   }
  //  ```

  //  Make sure to replace `'path/to/your/database.db'` with the actual path to your .db file.

// 4. **Query Table and Display Data in Terminal:**
//    You can call the functions `fetchAllData()` and `fetchDataUsingJoin()` to execute the queries and print the results in the terminal.

//    ```dart
   void main() {
     fetchAllData();
     fetchDataUsingJoin();
   }
//    ```

//    This will execute the queries and print the results to the terminal when you run your Flutter project.

// Remember to handle errors and exceptions appropriately, and ensure that your Flutter project has the necessary permissions to access the .db file.