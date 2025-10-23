import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/my_colors.dart';

class MyThemes {
  static const lightTheme = 'lightTheme';
  static const darkTheme = 'darkTheme';

  static List<String> themes = [lightTheme, darkTheme];

  static ThemeData mylightTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: MyColors.primary,
        titleTextStyle: TextStyle(
          color: MyColors.white,
          fontSize: 24,
          fontFamily: "Cairo",
          fontWeight: FontWeight.w600,
        ),
      ),
      listTileTheme: ListTileThemeData(
        
        tileColor: Color(0xffe6eef8),
        iconColor: MyColors.primary,
        titleTextStyle: TextStyle(
          color: MyColors.black,
          fontSize: 16,
          fontFamily: "Cairo",
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: TextTheme(),
      primarySwatch: Colors.deepPurple,
      fontFamily: 'Cairo',
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 16, color: MyColors.grey),
        labelStyle: TextStyle(fontSize: 16, color: MyColors.grey),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.primary),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.grey),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.grey),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: MyColors.grey),
        ),
        errorStyle: TextStyle(fontSize: 16, color: Colors.red),
      ),
    );
  }

  static ThemeData mydarkTheme() {
    return ThemeData(primarySwatch: Colors.deepPurple, fontFamily: 'Cairo');
  }
}
