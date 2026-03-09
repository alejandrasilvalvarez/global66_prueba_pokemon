// ignore_for_file: always_specify_types

import 'package:dio/dio.dart';

import '../commons/log.dart';

class ApiCInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    AppLogger().d('PUBLIC APIC');

    AppLogger().d('APIC[${options.method}] => PATH: ${options.path}');
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

  void generateOAuthHeaders(RequestOptions options) {
    options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    options.headers['Accept'] = 'application/json';
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger().d(
      '''STATUS: [${response.statusCode}] => PATH: ${response.requestOptions.path}''',
    );
    String rd =
        response.data.toString().replaceAll('�', '').split(',').join('\n');
    AppLogger().d(rd);
    AppLogger().d('============FIN RESPONSE=============');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger().d('============ ERROR RESPONSE API CONNECT =============');
    AppLogger().d(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    AppLogger().d(
      '''ERROR[${err.response?.statusCode}] => ${err.message.toString().replaceAll('�', '')}''',
    );
    String? er =
        err.response?.data.toString().replaceAll('�', '').split(',').join('\n');
    AppLogger().d(er ?? 'NO SE ENCONTRO INFORMACION DE ERROR');
    AppLogger().d('============ FIN ERROR RESPONSE API CONNECT =============');
    if (err.response?.statusCode == 401) {
      // final AuthBloc loginBloc = sl<AuthBloc>();
      // loginBloc.add(const LogoutEvent());
    } else if (err.response?.statusCode == 404) {
      AppLogger().d('ERROR: NO SE ENCONTRO API');
    }
    return super.onError(err, handler);
  }
}
