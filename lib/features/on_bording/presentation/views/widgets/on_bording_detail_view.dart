class OnboardPage {
  final String imagePath;
  final String title;
  final String description;

  OnboardPage({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

final List<OnboardPage> onboardingPages = [
  OnboardPage(
    imagePath: 'assets/images/onbording1.png',
    title: 'Free-Spirited Fashion Finds',
    description:
        'Browse thousands of products, from fashion to tech. Find what you love, effortlessly.',
  ),
  OnboardPage(
    imagePath: 'assets/images/onbording2.png',
    title: 'Dressing Well Made Easy',
    description: 'Discover a Collection That Speaks Volumes in Silence.',
  ),
  OnboardPage(
    imagePath: 'assets/images/onbording3.png',
    title: 'Elegance Redefined',
    description: 'Discover a world of timeless fashion for the modern woman.',
  ),
];
