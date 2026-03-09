import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:global66_prueba_pokemon/features/onboarding/presentation/viewmodel/splash_viewmodel.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('SplashViewModel', () {
    test('initial state completes and has data after waiting', () async {
      // AsyncNotifier initial build triggers a delay internally
      AsyncValue<void> provider = container.read(splashViewModelProvider);
      expect(provider.isLoading, true);

      // The build executes a 3 second delay.
      await Future<void>.delayed(const Duration(seconds: 3));
      await Future<void>.delayed(const Duration(milliseconds: 100)); // padding

      AsyncValue<void> postState = container.read(splashViewModelProvider);
      expect(postState.hasValue, true);
    });
  });
}
