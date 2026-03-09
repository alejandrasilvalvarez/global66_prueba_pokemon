part of com.global66.onboarding.widgets;

class OnboardingCarouselDot extends StatelessWidget {
  const OnboardingCarouselDot({
    required this.index,
    required this.currentPage,
    super.key,
  });

  final int index;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    bool isActive = currentPage == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: UILayout.small),
      height: UILayout.small,
      width: isActive ? UILayout.large : UILayout.small,
      decoration: BoxDecoration(
        color: isActive ? Azul.normal.color : Azul.semilight.color,
        borderRadius: radius12,
      ),
    );
  }
}
