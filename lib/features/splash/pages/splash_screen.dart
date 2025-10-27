import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ty/component/main_bottom.dart';
import 'package:se7ty/core/navigation/my_navigation.dart';
import 'package:se7ty/core/navigation/my_routes.dart';
import 'package:se7ty/core/utils/my_image.dart';

import '../../../component/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      pushreplace(context, MyRoutes.welcome, null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: LogoImage()));
  }
}
