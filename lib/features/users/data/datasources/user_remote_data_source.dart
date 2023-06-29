import 'package:bank_sp/features/users/data/models/user_test_model.dart';
import 'package:bank_sp/infrastructure/client/dio_client.dart';
import 'package:dio/dio.dart';

abstract class UserRemoteDataSource {
  Future<List<UserTestModel>> getUserList();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final _client = DioClient();

  @override
  Future<List<UserTestModel>> getUserList() async {
    final Response<Map<String, dynamic>> result = await _client.requestGet(
      'users',
    );
    final json = result.data ?? <String, dynamic>{};
    return (json as List).map((e) => UserTestModel.fromJson(e)).toList();
  }
}
