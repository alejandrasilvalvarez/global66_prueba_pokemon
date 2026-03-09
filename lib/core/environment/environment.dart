import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  /// [mode] can be
  /// [PROD, PT, QA, INTERNAL_PROD, INTERNAL_QA, INTERNAL_PT]
  static String mode = 'QA';
  static String get properties {
    switch (mode) {
      case 'PROD':
        return 'properties/PROD/.env.production';
      case 'QA':
        return 'properties/QA/.env.qa';
      case 'PT':
        return 'properties/PT/.env.pt';
      case 'INTERNAL_PROD':
        return 'properties/PROD/.env.production';
      case 'INTERNAL_QA':
        return 'properties/QA/.env.qa';
      case 'INTERNAL_PT':
        return 'properties/PT/.env.pt';
      default:
        return 'properties/pt/.env.pt';
    }
  }

  static String get env => dotenv.env['ENVIRONMENT']!;

  // BASE URL
  static String get authBaseUrl => dotenv.env['BASE_URL']!;

  //HOME
  static String get shortenPath => dotenv.env['SHORTEN_PATH']!;
  static String get readShortenedPath => dotenv.env['READ_SHORTEN_PATH']!;

  
}
