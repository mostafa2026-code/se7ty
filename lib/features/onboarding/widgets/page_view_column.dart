import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/features/onboarding/data/onboarding_model.dart';

class PageViewColumn extends StatelessWidget {
  const PageViewColumn({super.key, required this.model});

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SvgPicture.asset(
            model.imagePath,
            width: MediaQuery.of(context).size.width,
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
  }
}
