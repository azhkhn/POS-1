import '../../model/APISchemas/login_schema.dart';
import '../../model/DatabaseModels/userlogindata.dart';
import 'crud.dart';

createlogindata(LoginData logindata) async {
  final db = await NotesDatabase.instance.database;

  final id = await db.insert(userlogindata, logindata.toJson());
  return logindata.copy(id: id);
}
