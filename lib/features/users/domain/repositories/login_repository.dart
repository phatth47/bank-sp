import 'package:bank_sp/features/users/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<UserTest>> getUserList();
}