import '../../model/APISchemas/dashboard.dart';
import '../../model/DatabaseModels/dashboarddata.dart';
import 'crud.dart';

createdashboarddata(DashBoard dashboardata) async {
  final db = await NotesDatabase.instance.database;

  final id = await db.insert(dashboarddata, dashboardata.toJson());
  return dashboardata.copy(id: id);
}
