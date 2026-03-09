// ignore_for_file: unnecessary_await_in_return, cascade_invocations, always_specify_types, unnecessary_final, lines_longer_than_80_chars

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';

import 'apic_interceptor.dart';
import 'http_interceptor.dart';

class HttpService {
  Future<Response> request(
    String path, {
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, String>? headers,
  }) async {
    Dio dio = Dio();
    DioInterceptor interceptor = DioInterceptor();

    dio.interceptors.add(interceptor);

    final url = Uri.parse(path);

    return await dio.request(
      url.resolve(path).toString(),
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        method: method,
      ),
    );
  }

  Future<Response> secureRequest(
    String path, {
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, String>? headers,
  }) async {
    /* 
    convert my certificate to pem

    openssl x509 -in client.crt -out client.pem 
    openssl rsa -in client.key -out clientkey.pem
     */

    Dio dio = Dio();

    ApiCInterceptor interceptor = ApiCInterceptor();
    ByteData dataCRT = await rootBundle.load('assets/ca/client.pem');
    ByteData dataKey = await rootBundle.load('assets/ca/clientkey.pem');
    dio.interceptors.add(interceptor);

    // ignore: deprecated_member_use
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      SecurityContext serverContext = SecurityContext();

      serverContext.useCertificateChainBytes(dataCRT.buffer.asUint8List());
      serverContext.usePrivateKeyBytes(dataKey.buffer.asUint8List());
      // use a new client for add the certificate and accept auto signed 
      //certificate and return it
      var newClient = HttpClient(context: serverContext);
      newClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return newClient;
    };

    return await dio.request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        method: method,
      ),
    );
  }
}
