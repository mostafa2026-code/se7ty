import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/my_colors.dart';
import 'package:se7ty/core/utils/my_image.dart';
import 'package:se7ty/core/utils/my_styles.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      MyImage.se7ty,
      height: MediaQuery.of(context).size.height * .3,
      fit: BoxFit.cover,
    );
  }
}

class MainBottom extends StatelessWidget {
  final String title;
  final double? height;
  final double width;
  final VoidCallback? onPressed;
  final Color color;

  const MainBottom({
    super.key,
    required this.title,
    this.height = 45,
    this.width = double.infinity,
    required this.onPressed,

    this.color = MyColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,

          maximumSize: Size(width, 50),
        ),
        child: Text(
          title,
          style: MyStyles.n16primary().copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
