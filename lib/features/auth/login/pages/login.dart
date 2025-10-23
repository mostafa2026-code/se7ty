import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/core/utils/my_colors.dart';
import 'package:se7ty/core/utils/my_image.dart';
import 'package:se7ty/core/utils/my_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(MyImage.logo, height: 100, fit: BoxFit.cover),
            const Gap(20),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'الايميل ',
                suffix: Icon(Icons.mail, color: MyColors.primary),
              ),
            ),
            Gap(15),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'كلمة السر',
                suffix: Icon(Icons.visibility_off, color: MyColors.primary),
              ),
            ),
            const Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text("نسيت كلمة المرور ؟"),
                ),
              ],
            ),
            const Gap(15),
            MainBottom(title: "تسجيل الدخول"),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("ليس لديك حساب ؟"),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "إنشاء حساب جديد",
                    style: TextStyle(color: MyColors.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MainBottom extends StatelessWidget {
  final String title;
  const MainBottom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: MyColors.primary),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          maximumSize: const Size(double.infinity, 50),
        ),
        child: Text(
          title,
          style: MyStyles.n16primary().copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
