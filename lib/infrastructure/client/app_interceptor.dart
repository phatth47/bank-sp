import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {

  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {

  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {

  }
}