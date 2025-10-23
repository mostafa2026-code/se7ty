
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ty/core/utils/my_colors.dart';
import 'package:se7ty/core/utils/my_image.dart';
import 'package:se7ty/core/utils/my_styles.dart';

class LogoSVg extends StatelessWidget {
  const LogoSVg({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(MyImage.logo, height: 100, fit: BoxFit.cover);
  }
}

class MainBottom extends StatelessWidget {
  final String title;
  const MainBottom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primary,

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
