import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/onboarding_state.dart';

final NotifierProvider<OnboardingViewModel, OnboardingState>
onboardingViewModelProvider =
    NotifierProvider<OnboardingViewModel, OnboardingState>(
      OnboardingViewModel.new,
    );

class OnboardingViewModel extends Notifier<OnboardingState> {
  late final PageController pageController;

  @override
  OnboardingState build() {
    pageController = PageController();
    ref.onDispose(pageController.dispose);

    return const OnboardingState();
  }

  void onPageChanged(int index) {
    state = state.copyWith(currentPage: index);
  }

  void nextPage(int totalPages, VoidCallback onFinish) {
    if (state.currentPage < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      onFinish();
    }
  }
}
