import 'package:flutter/material.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:lahza/features/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:lahza/features/onboarding/presentation/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  int currentIndex = 0;

  final pages = [
    (
      image: AppAssets.onboarding1,
      title: AppStrings.onboardingTitle1,
      description: AppStrings.onboardingDescription1,
    ),
    (
      image: AppAssets.onboarding2,
      title: AppStrings.onboardingTitle2,
      description: AppStrings.onboardingDescription2,
    ),
    (
      image: AppAssets.onboarding3,
      title: AppStrings.onboardingTitle3,
      description: AppStrings.onboardingDescription3,
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.welcomeScreen);
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: pages.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final page = pages[index];

                      return OnboardingPage(
                        image: page.image,
                        title: page.title,
                        description: page.description,
                        onBack: currentIndex == 0 ? null : previousPage,
                      );
                    },
                  ),
                ),
              ),

              OnboardingIndicator(
                controller: pageController,
                count: pages.length,
              ),

              const SizedBox(height: 40),

              OnboardingButton(onTap: nextPage),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
