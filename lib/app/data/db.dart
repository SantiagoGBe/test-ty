import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Future<Database> createDB() async {
    return openDatabase(join(await getDatabasesPath(), 'test-tyba.db'),
        onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE user(id INTEGER PRIMARY KEY, email TEXT, password TEXT)',
      );
    }, version: 1);
  }
}
