import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/navigation_state.dart';

class NavigationViewModel extends Notifier<NavigationState> {
  @override
  NavigationState build() => NavigationState(selectedIndex: 0);

  void onTabSelected(int index) {
    if (state.selectedIndex == index) {
      return;
    }
    state = state.copyWith(selectedIndex: index);
  }
}

final NotifierProvider<NavigationViewModel, NavigationState>
navigationViewModelProvider =
    NotifierProvider<NavigationViewModel, NavigationState>(
      NavigationViewModel.new,
    );
