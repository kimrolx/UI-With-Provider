class OnboardingModel {
  final String title;
  final String description;

  OnboardingModel({
    required this.title,
    required this.description,
  });
}

class OnboardingContent {
  final List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      title: "Welcome to Eishi's Purr Shop!",
      description: "Find your purrfect partner for life!",
    ),
    OnboardingModel(
      title: "Your One-Stop Pet Shop Experience!",
      description:
          "Connect with 5-star pet caregivers near you who offer boarding, walking, ohuse sitting or day care.",
    ),
    OnboardingModel(
      title: "Get Started Now!",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et efficitur ligula"
          "Etiam ullamcorper maximus dapibus. Aliquam ac egestas arcu, vel efficitur leo.",
    ),
  ];
}
