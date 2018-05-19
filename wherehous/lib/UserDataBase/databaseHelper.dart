import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'user.dart';

class DatabaseHelper
{
  // database should be singleton
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper()=>_instance;

  static Database _db;

  Future<Database> get db async
  {
    if(_db != null)
    { //if it is null initDb handles it and create new directory 
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();
  initDb() async
  {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory(); // if we want to store anything locally, i was thinking a cache would be nice
    String path = join(documentDirectory.path, "main.db");                     // but we can still deny editing powers if no internet access
    var ourDb = await openDatabase(path,version: 1, onCreate: _onCreate);
    return ourDb;
  }
  
  void _onCreate(Database db, int version) async
  {
    await db.execute("CREATE TABLE User(id INTEGER PRIMARY KEY, username TEXT, password TEXT"); //SQL commands
    print("Table is created");
  }

  Future<int> saveUser(User user) async
  {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toMap());
    return res;
  }
}