import 'package:bank_sp/infrastructure/client/app_interceptor.dart';
import 'package:bank_sp/infrastructure/client/log_interceptor.dart';
import 'package:dio/dio.dart';

class DioClient {
  late Dio dio = _createDio();

  Dio _createDio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
      ),
    );

    dio.interceptors.add(AppInterceptor());
    dio.interceptors.add(LogInterceptors());
    return dio;
  }

  Future<Response<T>> requestPost<T>(
      final String path, {
        final dynamic data,
        final Map<String, dynamic>? queryParameters,
      }) {
    return dio.post(
      path,
      data: data ?? <String, dynamic>{},
      queryParameters: queryParameters ?? <String, dynamic>{},
    );
  }

  Future<Response<T>> requestPut<T>(
      final String path, {
        final dynamic data,
        final Map<String, dynamic>? queryParameters,
      }) {
    return dio.put(
      path,
      data: data ?? <String, dynamic>{},
      queryParameters: queryParameters ?? <String, dynamic>{},
    );
  }

  Future<Response<T>> requestDelete<T>(
      final String path, {
        final dynamic data,
        final Map<String, dynamic>? queryParameters,
      }) {
    return dio.delete(
      path,
      data: data ?? <String, dynamic>{},
      queryParameters: queryParameters ?? <String, dynamic>{},
    );
  }

  Future<Response<T>> requestGet<T>(
      final String path, {
        final Map<String, dynamic>? queryParameters,
      }) {
    return dio.get(
      path,
      queryParameters: queryParameters ?? <String, dynamic>{},
    );
  }

  Future<List<int>> getContentFileFromUrl(final String url) async {
    final Response response = await Dio().get(
      url,
      options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status != null && status < 500;
          }),
    );

    return response.data;
  }

  Future<List<int>> getContentFileFromPostMethod(
      final String url, {
        final dynamic data,
      }) async {
    final Response response = await dio.post(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        validateStatus: (status) {
          return status != null && status < 500;
        },
      ),
      data: data ?? <String, dynamic>{},
    );

    return response.data;
  }
}
