import '../../model/APISchemas/login_schema.dart';
import '../../model/DatabaseModels/userlogindata.dart';
import 'crud.dart';

Future<List<LoginData>> readAllLoginData() async {
    final db = await NotesDatabase.instance.database;

    const orderBy = '${LoginDatafields.id} DESC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(userlogindata, orderBy: orderBy);

    return result.map((json) => LoginData.fromJsonDatabase(json)).toList();
  }