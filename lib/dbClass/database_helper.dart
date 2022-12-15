import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:api_test/dbClass/user.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; //singleton DatabaseHelper
  static Database? _database; //Singletone Database

  String userTable = 'user_table';
  String colId = 'id';
  String colFirstname = 'firstname';
  String colLastname = 'lastname';
  String colEmail = 'email';
  String colPassword = 'password';
  String colPhoneNum = 'phoneNum';
  String colInterest = 'interest';

  DatabaseHelper._createInstance(); //Named Constructor to create Instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); //this executes only once, singleton object
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    //Get the directory path for both android and Ios to store database
    Directory directory = await getApplicationSupportDirectory();
    print(directory.path);
    String path = directory.path + 'users.db';

    //open/create the database at the given path
    var userDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return userDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $userTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colFirstname TEXT NOT NULL, $colLastname TEXT NOT NULL, $colEmail TEXT NOT NULL, $colPassword TEXT NOT NULL, $colPhoneNum TEXT NOT NULL, $colInterest TEXT NOT NULL)');
  }

  //Fetch Operation: Get all users objects from database
  Future<List<Map<String, dynamic>>> getUserMapList() async {
    Database db = await this.database;

    //var result = await db.rawQuery('SELECT * from $userTable order by $colId ASC');
    var result = await db.query(userTable, orderBy: '$colId ASC');
    return result;
  }

  //Insert Operation: Insert a user object to database
  Future<int> insertUser(User user) async {
    Database db = await this.database;
    var result = await db.insert(userTable, user.toMap());
    return result;
  }

  //Update Operation: Update a user and save it to database
  Future<int> updateUser(User user) async {
    Database db = await this.database;
    var result = await db.update(userTable, user.toMap(),
        where: '$colId = ?', whereArgs: [user.id]);
    return result;
  }

  //Delete Operation: Delete a User from database
  Future<int> DeleteUser(int id) async {
    Database db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $userTable WHERE $colId = $id');
    return result;
  }

  //Get number of User Objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> count =
        await db.rawQuery('SELECT COUNT (*) from $userTable');
    int result = Sqflite.firstIntValue(count)!;
    return result;
  }
}
