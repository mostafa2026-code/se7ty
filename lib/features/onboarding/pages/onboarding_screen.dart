import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ty/core/utils/my_image.dart';
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
              allowImplicitScrolling: false,
              reverse: true,

              controller: pageController,
              itemCount: MyImage.onboeardingImages.length,
              itemBuilder: (context, index) {
                String image = MyImage.onboeardingImages[index];
                return SvgPicture.asset(
                  image,
                  fit: BoxFit.contain,
                  height: 100,
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: MyImage.onboeardingImages.length,
          ),
        ],
      ),
    );
  }
}
