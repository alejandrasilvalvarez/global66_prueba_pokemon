part of com.global66.onboarding.widgets;

class OnboardingCarouselContent extends StatelessWidget {
  const OnboardingCarouselContent({
    required this.image,
    required this.title,
    required this.description,
    super.key,
  });
  final String image, title, description;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(UILayout.large),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Spacer(flex: 2),
        Expanded(flex: 4, child: Image.asset(image, fit: BoxFit.contain)),
        Spacing.spacingV16,
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: UILayout.medium,
            fontWeight: FontWeight.bold,
            color: TextColors.textPrimary.color,
          ),
        ),
        Spacing.spacingV16,
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: UILayout.mediumText,
            color: TextColors.textSecondary.color,
          ),
        ),
      ],
    ),
  );
}
