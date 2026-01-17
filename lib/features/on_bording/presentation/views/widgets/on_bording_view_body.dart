import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utilis/app_routes.dart';
import 'package:e_commerce_app/core/utilis/styles.dart';
import 'package:e_commerce_app/features/on_bording/presentation/views/widgets/on_bording_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBordingViewBody extends StatefulWidget {
  const OnBordingViewBody({super.key});

  @override
  State<OnBordingViewBody> createState() => _OnBordingViewBodyState();
}

class _OnBordingViewBodyState extends State<OnBordingViewBody> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < onboardingPages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      GoRouter.of(context).push(AppRouter.kRegisterView);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 24),

          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingPages.length,
              onPageChanged: (i) => setState(() => _currentPage = i),

              itemBuilder: (context, index) {
                final page = onboardingPages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Expanded(
                        child: Image.asset(page.imagePath, fit: BoxFit.contain),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Dots indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(onboardingPages.length, (i) {
              final bool isActive = i == _currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                width: isActive ? 18 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive ? kPrimaryColor : Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            }),
          ),

          const SizedBox(height: 18),

          Container(
            width: size.width,
            height: 270,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Title
                  Text(
                    onboardingPages[_currentPage].title,
                    style: Styles.textStyle18.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  // Description
                  Text(
                    onboardingPages[_currentPage].description,
                    style: const TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 18),

                  GestureDetector(
                    onTap: _onNext,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        _currentPage == onboardingPages.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account ? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kLoginView);
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
