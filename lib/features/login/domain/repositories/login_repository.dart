import 'package:bank_sp/core/errors/failure.dart';
import 'package:bank_sp/features/login/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> login(String username, String password);
}