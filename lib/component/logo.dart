import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ty/core/utils/my_image.dart';

class LogoSVg extends StatelessWidget {
  const LogoSVg({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(MyImage.logo, height: 100, fit: BoxFit.contain);
  }
}
