import 'package:se7ty/core/utils/my_image.dart';

class OnboardingModel {
  final String title;
  final String description;
  final String imagePath;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    title: "مرحبا بك في تطبيقنا",
    description: "اكتشف ميزات رائعة تساعدك في حياتك اليومية.",
    imagePath: MyImage.onboarding1,
  ),
  OnboardingModel(
    title: "تتبع صحتك",
    description: "راقب نشاطك البدني وصحتك بسهولة.",
    imagePath: MyImage.onboarding2,
  ),
  OnboardingModel(
    title: "ابق على اتصال",
    description: "تواصل مع أصدقائك وعائلتك في أي وقت.",
    imagePath: MyImage.onboarding3,
  ),
];