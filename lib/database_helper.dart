import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/userpage.dart';
import 'package:flutter_application_1/users.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;
  final String tableUser = "User";
  final String columnId = "id";
  final String columnUserName = "username";
  final String columnPassword = "password";

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY,  username TEXT, password TEXT)");
    print("Table is created");
  }

  //insertion
  Future<int?> saveUser(User user) async {
    var dbClient = await db;
    int? res = await dbClient?.insert("User", user.toMap());
    return res;
  }


 Future<List> select(username,pass) async {
    var dbClient = await db;
   List res = await dbClient!.query(tableUser,
        columns: [columnId,columnUserName, columnPassword],
        where: "$columnUserName = ? and $columnPassword = ?",
        whereArgs: [username,pass]) ;
        
    return res;
}

}