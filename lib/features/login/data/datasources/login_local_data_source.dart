import 'package:bank_sp/features/login/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDataSource {
  Future<void> cacheUser(UserModel userToCache);

  Future<UserModel> getLastUser();
}

const cacheUser = 'CACHED_USER';

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheUser(UserModel userToCache) async {
    // Do something
  }

  @override
  Future<UserModel> getLastUser() async {
    // Do something
    return const UserModel(
      id: '',
      name: 'John Doe',
    );
  }
}
