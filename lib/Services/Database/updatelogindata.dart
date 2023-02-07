import 'package:sqflite/sqflite.dart';
import '../../model/APISchemas/login_schema.dart';
import '../../model/DatabaseModels/userlogindata.dart';
import 'crud.dart';

Future updatelogindata(LoginData logindataupdate) async {
  final db = await NotesDatabase.instance.database;

  return db.update(userlogindata, logindataupdate.toJson(),
      where: '${LoginDatafields.id} = ?',
      whereArgs: [logindataupdate.id],
      conflictAlgorithm: ConflictAlgorithm.replace);
}
