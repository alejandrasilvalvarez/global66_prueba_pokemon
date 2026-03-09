// ignore_for_file: always_specify_types

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../commons/log.dart';

class DioInterceptor extends Interceptor {
  final List<String> publics = <String>['/keys', '/mobile/parameters'];
  final List<String> loginPaths = <String>['/login', '/auth'];
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String rquid = UniqueKey().hashCode.toString();
    options.headers['X-RqUID'] = rquid;

    AppLogger().d('METHOD: [${options.method}] => PATH: ${options.path}');
    AppLogger().d('===========HEADERS===========');
    String oh = options.headers.toString().split(',').join('\n');
    String pd = options.data.toString().split(',').join('\n');
    String qp = options.queryParameters.toString().split(',').join('\n');
    AppLogger().d(oh);
    AppLogger().d('QUERY PARAMETERS');
    AppLogger().d(qp);
    AppLogger().d('BODY');
    AppLogger().d(pd);
    AppLogger().d('============FIN=============');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger().d(
      '''STATUS: [${response.statusCode}] => PATH: ${response.requestOptions.path}''',
    );
    String rd = response.data.toString().split(',').join('\n');
    AppLogger().d(rd);
    AppLogger().d('============FIN RESPONSE=============');

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger().d('============ ERROR RESPONSE =============');
    AppLogger().d(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    AppLogger().d('ERROR[${err.response?.statusCode}] => ${err.message}');
    AppLogger().d('ERROR[${err.response?.data.toString()}]');
    AppLogger().d('============ FIN ERROR RESPONSE =============');
    bool shouldBeIgnored = _shouldBeIgnored(err.requestOptions.path);

    if (err.response?.statusCode == 401 && !shouldBeIgnored) {
      AppLogger().d('ERROR 401: CIERRE DE SESION ${err.requestOptions.path}');
    } else if (err.response?.statusCode == 404) {
      AppLogger().d('ERROR: NO SE ENCONTRO API');
    }
    return super.onError(err, handler);
  }

  bool _shouldBeIgnored(String path) {
    String uri = '/${path.split('/').last}';
    List<String> ignoredPathList = <String>['/login', '/auth', '/keys'];
    for (String p in ignoredPathList) {
      if (uri == p) {
        return true;
      }
    }
    return false;
  }
}
