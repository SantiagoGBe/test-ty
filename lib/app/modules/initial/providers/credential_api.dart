import 'package:get/get.dart';
import 'package:test_tyba/app/data/database/user_db.dart';
import 'package:test_tyba/app/data/models/user.dart';

class CredentialAPI extends GetConnect {
  Future<User?> registerUser({required User user}) async {
    final result = await UserDB.insertUser(user);
    return result;
  }

  Future<User?> loginUser({required User user}) async {
    final result = await UserDB.loginUser(user);
    return result;
  }
}
