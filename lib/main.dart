import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/internacionalization/l10n/app_localizations.dart';
import 'core/internacionalization/locale_provider.dart';
import 'core/routes/routes.dart';
import 'core/ui/theme_data.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      try {
        await dotenv.load(fileName: '.env');
      } catch (_) {}

      runApp(const ProviderScope(child: MyApp()));
    },
    (Object error, StackTrace stackTrace) {
      // Manejo de errores o Crashlytics
    },
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GoRouter router = ref.watch(routerProvider);
    Locale currentLocale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Tu App con Riverpod',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: currentLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
