import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:global66_prueba_pokemon/core/internacionalization/l10n/app_localizations.dart';
import 'package:global66_prueba_pokemon/features/onboarding/presentation/view/pages.dart';
import 'package:global66_prueba_pokemon/features/onboarding/presentation/widgets/widgets.dart';

/// Helper to pump the OnboardingView with all
/// required providers and localization.
Widget createOnboardingTestWidget() => const ProviderScope(
  child: MaterialApp(
    locale: Locale('es'),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: OnboardingView(),
  ),
);

void main() {
  group('OnboardingView', () {
    testWidgets('renders first onboarding page with title and description', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createOnboardingTestWidget());

      await tester.pumpAndSettle();

      // Should display the first onboarding title (Spanish)
      expect(find.text('Todos los Pokémon en un solo lugar'), findsOneWidget);

      // Should display the first onboarding description
      expect(
        find.text(
          '''Accede a una amplia lista de Pokémon de todas las generaciones creadas por Nintendo''',
        ),
        findsOneWidget,
      );
    });

    testWidgets('displays "Continuar" button on first page', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createOnboardingTestWidget());

      await tester.pumpAndSettle();

      expect(find.text('Continuar'), findsOneWidget);
    });

    testWidgets('displays "Comenzar" button on last page', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createOnboardingTestWidget());

      await tester.pumpAndSettle();

      // Swipe left to go to the last page
      await tester.drag(find.byType(PageView), const Offset(-400, 0));
      await tester.pumpAndSettle();

      expect(find.text('Comenzar'), findsOneWidget);
    });

    testWidgets('has a language dropdown with ES selected by default', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createOnboardingTestWidget());

      await tester.pumpAndSettle();

      // Dropdown should contain 'ES' as selected value
      expect(find.text('ES'), findsOneWidget);
    });

    testWidgets('renders the correct number of dots', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createOnboardingTestWidget());

      await tester.pumpAndSettle();

      // There are 2 onboarding pages, so 2 dots
      expect(find.byType(OnboardingCarouselDot), findsNWidgets(2));
    });

    testWidgets('swiping changes the dot indicator', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createOnboardingTestWidget());

      await tester.pumpAndSettle();

      // Swipe to second page
      await tester.drag(find.byType(PageView), const Offset(-400, 0));
      await tester.pumpAndSettle();

      // Should now show the second page's title
      expect(find.text('Mantén tu Pokédex actualizada'), findsOneWidget);
    });
  });
}
