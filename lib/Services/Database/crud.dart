import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/DatabaseModels/dashboarddata.dart';
import '../../model/DatabaseModels/userlogindata.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path,
        version: 1, onCreate: _createDB, onUpgrade: _upgrade);
  }

  Future _createDB(Database db, int version) async {

    await db.execute('''
    CREATE TABLE $userlogindata (
      ${LoginDatafields.id} INTEGER PRIMARY KEY AUTOINCREMENT, 
      ${LoginDatafields.branchId} TEXT , 
      ${LoginDatafields.agency} TEXT,
      ${LoginDatafields.tlId} TEXT , 
      ${LoginDatafields.dealerId} TEXT,
      ${LoginDatafields.empName} TEXT , 
      ${LoginDatafields.appId} TEXT,  
      ${LoginDatafields.loginId} TEXT   ) ''');

    await db.execute('''
    CREATE TABLE $dashboarddata (
      ${Dashboarddatafields.id} INTEGER PRIMARY KEY AUTOINCREMENT, 
      ${Dashboarddatafields.dealername} TEXT , 
      ${Dashboarddatafields.dealeraddress} TEXT,
      ${Dashboarddatafields.designation} TEXT , 
      ${Dashboarddatafields.otp} TEXT,
      ${Dashboarddatafields.noticeBoard} TEXT  ) ''');

    // await db.execute('''
    //   CREATE TABLE $branchlist  (
    // ${NoteFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
    // ${NoteFields.branchname} TEXT ,
    // ) ''');
  }

  FutureOr<void> _upgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      //  await db.execute('''
      //   CREATE TABLE $tableNotes (
      //     ${NoteFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
      //     ${NoteFields.age} INTEGER ,
      //     ${NoteFields.name} TEXT ),
      //     ${NoteFields.imagename} TEXT ),
      //     ${NoteFields.imagepath} TEXT )
      //     ''');
    }
  }

  // Future<Note> create(Note note) async {
  //   final db = await instance.database;

  //   final id = await db.insert(tableNotes, note.toJson());
  //   return note.copy(id: id);
  // }

  // Future<Note> readNote(int id) async {
  //   final db = await instance.database;

  //   final maps = await db.query(
  //     tableNotes,
  //     columns: NoteFields.values,
  //     where: '${NoteFields.id} = ?',
  //     whereArgs: [id],
  //   );

  //   if (maps.isNotEmpty) {
  //     return Note.fromJsonDatabase(maps.first);
  //   } else {
  //     throw Exception('ID $id not found');
  //   }
  // }

  // Future<List<Note>> readAllNotes() async {
  //   final db = await instance.database;

  //   const orderBy = '${NoteFields.id} DESC';
  //   // final result =
  //   //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

  //   final result = await db.query(tableNotes, orderBy: orderBy);

  //   return result.map((json) => Note.fromJsonDatabase(json)).toList();
  // }

  // Future<int> update(Note note) async {
  //   final db = await instance.database;

  //   return db.update(tableNotes, note.toJson(),
  //       where: '${NoteFields.id} = ?',
  //       whereArgs: [note.id],
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  // Future<int> delete(int id) async {
  //   final db = await instance.database;

  //   return await db.delete(
  //     tableNotes,
  //     where: '${NoteFields.id} = ?',
  //     whereArgs: [id],
  //   );
  // }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
