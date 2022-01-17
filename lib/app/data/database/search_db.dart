import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_tyba/app/data/db.dart';
import 'package:test_tyba/app/data/models/search.dart';

class SearchDB {
  static Future<List> insertSearch(Search search) async {
    final db = await DB.createDB();
    final List result;

    await db.insert(
      'search',
      search.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    result = await bringSearchs(id: search.userId);

    return result;
  }

  static Future<List> bringSearchs({int? id}) async {
    final db = await DB.createDB();
    final box = GetStorage();
    final token = box.read('token');
    final List result;

    result = await db
        .query('search', where: 'user_id = ?', whereArgs: [id ?? token]);
    return result;
  }
}
