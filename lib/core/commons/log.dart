import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  factory AppLogger() => _singleton;

  AppLogger._internal();

  static final AppLogger _singleton = AppLogger._internal();

  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  void d(String message) {
    if (kDebugMode) {
      _logger.d(message);
    }
  }
}
