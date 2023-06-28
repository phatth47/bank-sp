import 'package:bank_sp/core/errors/failure.dart';
import 'package:bank_sp/core/usecases/usecase.dart';
import 'package:bank_sp/features/login/domain/entities/user.dart';
import 'package:bank_sp/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class PostLoginUser implements UseCase<User, Params> {
  final LoginRepository repository;

  PostLoginUser(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.login(params.user.id, params.user.name);
  }
}

class Params {
  final User user;

  Params({required this.user});
}