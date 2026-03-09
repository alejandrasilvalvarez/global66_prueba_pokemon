import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:global66_prueba_pokemon/features/main_wrapper/state/navigation_state.dart';
import 'package:global66_prueba_pokemon/features/main_wrapper/viewmodel/navigation_viewmodel.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('NavigationViewModel', () {
    test('initial state has selectedIndex 0', () {
      NavigationState state = container.read(navigationViewModelProvider);
      expect(state.selectedIndex, 0);
    });

    test('onTabSelected updates selectedIndex', () {
      container.read(navigationViewModelProvider.notifier).onTabSelected(1);
      NavigationState state = container.read(navigationViewModelProvider);
      expect(state.selectedIndex, 1);
    });

    test('onTabSelected does not emit new state if index is the same', () {
      NavigationViewModel viewModel = container.read(
        navigationViewModelProvider.notifier,
      );
      NavigationState initialState = container.read(
        navigationViewModelProvider,
      );

      viewModel.onTabSelected(0);

      NavigationState newState = container.read(navigationViewModelProvider);
      expect(identical(initialState, newState), isTrue);
    });
  });
}
