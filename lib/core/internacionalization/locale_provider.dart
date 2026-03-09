import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

const Map<String, Locale> supportedLanguages = <String, Locale>{
  'ES': Locale('es'),
  'EN': Locale('en'),
};

// Este provider gestiona el idioma actual de la app
final StateProvider<Locale> localeProvider = StateProvider<Locale>(
  (Ref ref) => const Locale('es'),
);
