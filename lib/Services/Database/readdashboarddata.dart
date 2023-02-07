import '../../model/APISchemas/dashboard.dart';
import '../../model/DatabaseModels/dashboarddata.dart';
import 'crud.dart';

Future<List<DashBoard>> readAllDashboardData() async {
    final db = await NotesDatabase.instance.database;

    const orderBy = '${Dashboarddatafields.id} DESC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(dashboarddata, orderBy: orderBy);

    return result.map((json) => DashBoard.fromJsonDatabase(json)).toList();
  }