import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/core/navigation/my_navigation.dart';
import 'package:se7ty/core/navigation/my_routes.dart';
import 'package:se7ty/core/utils/my_colors.dart';
import 'package:se7ty/core/utils/my_image.dart';
import 'package:se7ty/features/onboarding/data/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (currentIndex != onboardingPages.length - 1)
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    pushreplace(context, MyRoutes.welcome, null);
                  },
                  child: Text("تخطي"),
                ),
              ),

            Expanded(
              child: PageView.builder(
                reverse: true,
                physics: const BouncingScrollPhysics(),

                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
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
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Gap(10),
                      Text(
                        model.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      Gap(15),
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
            Gap(20),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: onboardingPages.length,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: MyColors.primary,
                    ),
                  ),
                  Gap(10),
                  // if (currentIndex == onboardingPages.length - 1)
                  //   MainBottom(
                  //     title: "هيا بنا",
                  //     onPressed: () {},
                  //     width: 50,
                  //     height: 50,
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
