import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ty/core/utils/my_colors.dart';
import 'package:se7ty/core/utils/my_image.dart';
import 'package:se7ty/features/onboarding/data/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: MyImage.onboeardingImages.length,
              itemBuilder: (context, index) {
                OnboardingModel model = onboardingPages[index];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                        model.imagePath,
                        width: MediaQuery.of(context).size.width * .75,
                      ),
                    ),
                    Text(
                      model.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      model.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: onboardingPages.length,
            effect: const ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: MyColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
