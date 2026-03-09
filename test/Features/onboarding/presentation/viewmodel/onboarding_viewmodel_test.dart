import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:global66_prueba_pokemon/features/onboarding/presentation/state/onboarding_state.dart';
import 'package:global66_prueba_pokemon/features/onboarding/presentation/viewmodel/onboarding_viewmodel.dart';
import 'package:mocktail/mocktail.dart';

class MockPageController extends Mock implements PageController {}

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('OnboardingViewModel', () {
    test('initial state has currentPage 0', () {
      OnboardingState state = container.read(onboardingViewModelProvider);
      expect(state.currentPage, 0);
    });

    test('onPageChanged updates currentPage', () {
      container.read(onboardingViewModelProvider.notifier).onPageChanged(1);
      OnboardingState state = container.read(onboardingViewModelProvider);
      expect(state.currentPage, 1);
    });

    test('nextPage calls onFinish when on the last page', () {
      OnboardingViewModel viewModel = container.read(
        onboardingViewModelProvider.notifier,
      );

      // We manually update state to simulate being on the last page
      viewModel.onPageChanged(2);

      bool finishCalled = false;
      viewModel.nextPage(3, () {
        finishCalled = true;
      });

      expect(finishCalled, isTrue);
    });
  });
}
