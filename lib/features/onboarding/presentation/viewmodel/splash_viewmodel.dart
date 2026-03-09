import 'package:flutter_riverpod/flutter_riverpod.dart';

final AsyncNotifierProvider<SplashViewModel, void> splashViewModelProvider =
    AsyncNotifierProvider<SplashViewModel, void>(SplashViewModel.new);

class SplashViewModel extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    await Future<dynamic>.delayed(const Duration(seconds: 3));
  }
}
