import 'package:bank_sp/core/errors/failure.dart';
import 'package:bank_sp/features/login/data/datasources/login_local_data_source.dart';
import 'package:bank_sp/features/login/data/datasources/login_remote_data_source.dart';
import 'package:bank_sp/features/login/domain/entities/user.dart';
import 'package:bank_sp/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginLocalDataSource localDataSource;
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, User>> login(String username, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

}