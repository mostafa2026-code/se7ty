import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:se7ty/core/my_themes.dart/my_themes.dart';
import 'package:se7ty/features/auth/login/pages/login.dart';
import 'package:se7ty/features/auth/register/pages/doctor_register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: "assets/translation",
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('ar'),
      child: const Se7ty(),
    ),
  );
}

class Se7ty extends StatelessWidget {
  const Se7ty({super.key});

  @override
  Widget build(BuildContext context) {
    // هنا المهم: نستخدم context.locale عشان يعمل rebuild

    return MaterialApp(
      home: DoctorRegisterScreen(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // routerConfig: MyRoutes.myroutes,
      theme: MyThemes.mylightTheme(),

      // نظبط الاتجاه هنا
      builder: (context, router) {
        return Directionality(
          textDirection: isArabic(context)
              ? ui.TextDirection.ltr
              : ui.TextDirection.rtl,
          child: router!,
        );
      },
    );
  }
}

bool isArabic(BuildContext context) {
  return context.locale.languageCode == "ar";
}
