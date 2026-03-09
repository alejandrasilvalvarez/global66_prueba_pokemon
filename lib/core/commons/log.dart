import 'package:logger/logger.dart';

class AppLogger {

  factory AppLogger() => _singleton;

  AppLogger._internal();
  List<dynamic> logs = <dynamic>[];
  final Logger _logger = Logger();
  static final AppLogger _singleton = AppLogger._internal();
  void d(String message) {
    String date = DateTime.now().toString();
    logs..add('------------------')
    ..add(date)
    ..add('')

    ..add(message);
    _logger.d(message);
  }

  void get clearLogs => logs.clear();

  void get log => logs;
}
