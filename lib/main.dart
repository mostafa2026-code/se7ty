import 'package:flutter/material.dart';
import 'package:se7ty/core/my_themes.dart/my_themes.dart';

void main() {
  runApp(const Se7ty());
}

class Se7ty extends StatelessWidget {
  const Se7ty({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemes.mylightTheme(),
      home: const Scaffold(body: Center(child: Text('Se7ty'))),

    );
  }
}
