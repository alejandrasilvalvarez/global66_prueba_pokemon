// ignore_for_file: always_specify_types

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../commons/log.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String rquid = UniqueKey().hashCode.toString();
    options.headers['X-RqUID'] = rquid;

    AppLogger().d('→ [${options.method}] ${options.path}');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger().d('← [${response.statusCode}] ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger().d(
      '''✖ [${err.response?.statusCode}] ${err.requestOptions.path} — ${err.message}''',
    );
    return super.onError(err, handler);
  }
}
