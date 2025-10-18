import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ty/core/navigation/my_navigation.dart';
import 'package:se7ty/core/navigation/my_routes.dart';
import 'package:se7ty/core/utils/my_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:se7ty/core/utils/my_styles.dart';
import 'package:se7ty/main.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Current Language: ${context.locale.languageCode}');
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            MyImage.welcome,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              textDirection: isArabic(context)
                  ? ui.TextDirection.ltr
                  : ui.TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                const Spacer(flex: 1),
                IconButton(
                  onPressed: () {
                    if (context.locale.languageCode == "ar") {
                      context.setLocale(const Locale("en"));
                    } else if (context.locale.languageCode == "en") {
                      context.setLocale(const Locale("ar"));
                    }
                  },
                  icon: Icon(Icons.language),
                ),
                Text("welcome".tr(), style: MyStyles.b30primary()),
                Gap(20),
                Text(
                  "login_subtitle".tr(),
                  style: MyStyles.n16black(),
                  textAlign: TextAlign.end,
                ),
                Spacer(flex: 2),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xff64aec2).withValues(alpha: .6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textDirection: isArabic(context)
                        ? ui.TextDirection.ltr
                        : ui.TextDirection.rtl,
                    children: [
                      Text("login_as".tr(), style: MyStyles.b16primary()),
                      Gap(20),
                      LoginAsBottom(
                        route: MyRoutes.login,
                        title: "doctor".tr(),
                      ),
                      Gap(10),
                      LoginAsBottom(
                        route: MyRoutes.login,
                        title: "patient".tr(),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginAsBottom extends StatelessWidget {
  final String route;
  final String title;

  const LoginAsBottom({super.key, required this.route, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          push(context, route, null);
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffbedce9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          maximumSize: Size(double.infinity, 50),
        ),
        child: Text(title.tr(), style: MyStyles.n16black()),
      ),
    );
  }
}
