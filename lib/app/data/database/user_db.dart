import 'package:sqflite/sqflite.dart';
import 'package:test_tyba/app/data/db.dart';
import 'package:test_tyba/app/data/models/user.dart';

class UserDB {
  static Future<User?> insertUser(User user) async {
    final db = await DB.createDB();
    final User result;

    final users = await db.query('user',
        columns: ['email'], where: 'email = ?', whereArgs: [user.email]);

    if (users.isEmpty) {
      final id = await db.insert(
        'user',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );

      final users = await db.query('user',
          columns: ['id'], where: 'id = ?', whereArgs: [id]);

      final auxUser = users[0];
      result = User(
          id: auxUser['id'] as int,
          email: auxUser['email'] as String,
          password: auxUser['password'] as String);
      return result;
    } else {
      return null;
    }
  }

  static Future<User?> loginUser(User user) async {
    final db = await DB.createDB();
    final User result;

    final users =
        await db.query('user', where: 'email = ?', whereArgs: [user.email]);

    if (users.isNotEmpty) {
      final auxUser = users[0];
      if (user.password == users[0]['password']) {
        result = User(
            id: auxUser['id'] as int,
            email: auxUser['email'] as String,
            password: auxUser['password'] as String);
        return result;
      }
    } else {
      return null;
    }
  }
}
