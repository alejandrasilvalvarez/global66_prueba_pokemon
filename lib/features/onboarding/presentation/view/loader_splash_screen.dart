part of com.global66.onboarding.views;

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.5, curve: Curves.easeIn),
    );

    _controller
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat();
        }
      })
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashViewModelProvider, (_, AsyncValue<void> next) {
      if (next is AsyncData) {
        context.go('/onboarding');
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeInAnimation,
          child: RotationTransition(
            turns: _controller,
            child: SvgPicture.asset(
              AssetsConstants.loaderSplash,
              width: UILayout.xxxlarge,
              height: UILayout.xxxlarge,
            ),
          ),
        ),
      ),
    );
  }
}
