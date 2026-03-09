// ignore_for_file: always_specify_types

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../environment/environment.dart';
import 'apic_interceptor.dart';
import 'http_interceptor.dart';

class HttpService {
  HttpService() {
    _dio = _createDio(DioInterceptor());
  }

  late final Dio _dio;
  Dio? _secureDio;

  /// Configuración base compartida entre ambos ambientes
  BaseOptions get _baseOptions => BaseOptions(
    baseUrl: Environment.authBaseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  );

  Dio _createDio(Interceptor interceptor) {
    Dio dio = Dio(_baseOptions);
    dio.interceptors.add(interceptor);
    return dio;
  }

  /// Request estándar sin certificado SSL de cliente.
  Future<Response> request(
    String path, {
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, String>? headers,
  }) async => _dio.request(
    path,
    data: data,
    queryParameters: queryParameters,
    options: Options(headers: headers, method: method),
  );

  /// Request seguro con certificado SSL de cliente (mTLS).
  /// El cliente se inicializa una sola vez y se reutiliza.
  Future<Response> secureRequest(
    String path, {
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, String>? headers,
  }) async {
    _secureDio ??= await _initSecureDio();

    return _secureDio!.request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers, method: method),
    );
  }

  /// Inicializa el cliente Dio seguro con certificados SSL.
  /// Se ejecuta una sola vez (lazy init).
  Future<Dio> _initSecureDio() async {
    Dio dio = _createDio(ApiCInterceptor());

    ByteData dataCRT = await rootBundle.load('assets/ca/client.pem');
    ByteData dataKey = await rootBundle.load('assets/ca/clientkey.pem');

    // ignore: deprecated_member_use
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
          SecurityContext serverContext = SecurityContext()
            ..useCertificateChainBytes(dataCRT.buffer.asUint8List())
            ..usePrivateKeyBytes(dataKey.buffer.asUint8List());

          HttpClient newClient = HttpClient(context: serverContext)
            ..badCertificateCallback =
                (X509Certificate cert, String host, int port) => !kReleaseMode;
          return newClient;
        };

    return dio;
  }
}
