import 'package:bank_sp/core/usecases/usecase.dart';
import 'package:bank_sp/features/users/domain/entities/user.dart';
import 'package:bank_sp/features/users/domain/repositories/login_repository.dart';

class GetUserList implements UseCaseT<List<UserTest>, NoParams> {
  final UserRepository repository;

  GetUserList(this.repository);

  @override
  Future<List<UserTest>> call() async {
    return await repository.getUserList();
  }
}