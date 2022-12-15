import 'package:api_test/dbClass/database_helper.dart';
import 'package:api_test/dbClass/user.dart';

class UserService {
  late DatabaseHelper _databaseHelper;
  UserService() {
    _databaseHelper = DatabaseHelper();
  }

  Future<int> SaveUser(User user) async {
    var result = await _databaseHelper.insertUser(user);
    return result;
  }
}
