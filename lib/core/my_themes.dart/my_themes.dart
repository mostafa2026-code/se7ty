import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/my_colors.dart';

class MyThemes {

  static const lightTheme = 'lightTheme';
  static const darkTheme = 'darkTheme';


  static List<String> themes = [
    lightTheme,
    darkTheme,
  ];
  static ThemeData mylightTheme (){
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: 'Cairo',
      inputDecorationTheme: 
      InputDecorationTheme(
        hintStyle: TextStyle(
          fontSize: 16,
          color:MyColors.grey
        ),
        labelStyle: TextStyle(
          fontSize: 16,
          color:MyColors.grey
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.primary,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.grey,
    
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
      
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,           
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.grey       
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.grey,         
          ),
        ),
        errorStyle: TextStyle(
          fontSize: 16,
          color: Colors.red
        ),
      ), 
    );
  }
  static ThemeData mydarkTheme(){
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: 'Cairo',
    );

  }
}