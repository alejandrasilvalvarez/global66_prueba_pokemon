// ignore_for_file: always_specify_types

import 'package:dio/dio.dart';

import '../commons/log.dart';

class ApiCInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    AppLogger().d('🔒 → [${options.method}] ${options.path}');
    return super.onRequest(options, handler);
  }

  void generateOAuthHeaders(RequestOptions options) {
    options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    options.headers['Accept'] = 'application/json';
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger().d(
      '🔒 ← [${response.statusCode}] ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger().d(
      '🔒 ✖ [${err.response?.statusCode}] ${err.requestOptions.path} — ${err.message}',
    );
    return super.onError(err, handler);
  }
}
