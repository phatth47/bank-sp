import 'package:bank_sp/features/users/data/datasources/user_remote_data_source.dart';
import 'package:bank_sp/features/users/domain/entities/user.dart';
import 'package:bank_sp/features/users/domain/repositories/login_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<UserTest>> getUserList() async {
    try {
      final r = await remoteDataSource.getUserList();
      return r;
    } catch (e) {
      return [];
    }
  }
}