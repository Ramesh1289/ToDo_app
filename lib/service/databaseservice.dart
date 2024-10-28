import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/user.dart';

class Dbservice {
  Dbservice._internal();

  static final Dbservice _instance = Dbservice._internal();
  static Database? _database;

  factory Dbservice(){
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initdb();
    return _database!;
  }

  initdb() async {
    String path = join(await getDatabasesPath(), "dbdata.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            '''
          CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT NOT NULL,
          email TEXT NOT NULL,
          password TEXT NOT NULL
          )
          '''
        );
      },
    );
  }

  Future<int> createuser(User user) async {
    var dbclient = await database;
    return await dbclient.insert("users", user.toMap());
  }

  Future<int> insertUser(String email, String password) async {
    final dbclient = await database;
    return await dbclient.insert(
        'users', {'email': email, 'password': password});
  }

  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    final dbclient = await database;
    final result = await dbclient.query(
        "users", where: "email=? AND password=?", whereArgs: [email, password]);
    return result.isNotEmpty ? result.first : null;
  }


}

class DatabaseHelper{
  DatabaseHelper._internal();
  static final DatabaseHelper _instance=DatabaseHelper._internal();
  factory DatabaseHelper()=> _instance;
  static Database? _database;
  Future<Database> get database async{
    if(_database!=null)return _database!;
    _database =await _initDatabase();
    return _database!;
  }
  Future<Database>_initDatabase() async{
    String path=join(await getDatabasesPath(),'task_db.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db,version){
        return db.execute(
            '''
          CREATE TABLE tasks(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          description TEXT NOT NULL,
          date TEXT NOT NULL,
          priority TEXT NOT NULL
          )
          '''

        );
      }
    );
  }
  Future<void> insertTask(Task task) async{
    final db=await database;
    await db.insert('tasks', task.toMap(),
    conflictAlgorithm:
    ConflictAlgorithm.replace,
    );
  }
  Future<List<Task>>tasks() async{
    final db=await database;
    final List<Map<String,dynamic>> maps=await db.query('tasks');
    return List.generate(maps.length,(i){
      return Task(
          id:maps[i]['id'],
          title: maps[i]['title'],
          description: maps[i]['description'],
          date: maps[i]['date'],
          priority: maps[i]['priority'],
      );
    });

  }
  Future<void> updateTask(Task task,int id)async{
    final db=await database;
    await db.update('tasks',task.toMap(),
      where: 'id=?',
      whereArgs: [task.id],
    );
  }
  Future<void> deleteTask(int  id)async{
    final db=await database;
    await db.delete(
      'tasks',
      where: 'id=?',
      whereArgs: [id],
    );
  }

}


