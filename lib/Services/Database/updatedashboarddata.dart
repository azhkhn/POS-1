import 'package:sqflite/sqflite.dart';
import '../../model/APISchemas/dashboard.dart';
import '../../model/DatabaseModels/dashboarddata.dart';
import 'crud.dart';

Future<int> updatedashboarddata(DashBoard dashboarddataupdate) async {
    final db = await NotesDatabase.instance.database;

    return db.update(dashboarddata, dashboarddataupdate.toJson(),
        where: '${Dashboarddatafields.id} = ?',
        whereArgs: [dashboarddataupdate.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }