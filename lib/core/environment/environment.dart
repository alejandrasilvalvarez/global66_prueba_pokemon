import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  /// [mode] puede ser: PROD, PT, QA, INTERNAL_PROD, INTERNAL_QA, INTERNAL_PT
  static String mode = 'QA';

  static const Map<String, String> _envPaths = <String, String>{
    'PROD': 'properties/PROD/.env.prod',
    'QA': 'properties/QA/.env.qa',
    'PT': 'properties/PT/.env.pt',
    'INTERNAL_PROD': 'properties/PROD/.env.prod',
    'INTERNAL_QA': 'properties/QA/.env.qa',
    'INTERNAL_PT': 'properties/PT/.env.pt',
  };

  static String get properties => _envPaths[mode] ?? 'properties/QA/.env.qa';

  static String get env => dotenv.env['ENVIRONMENT']!;

  // BASE URL
  static String get authBaseUrl => dotenv.env['BASE_URL']!;
}
