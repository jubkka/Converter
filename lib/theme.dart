import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme {
  static ThemeData get mainTheme {
    //1
    return ThemeData(
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.black),
            )
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: MyColors.textColor,
              fontSize: 50,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.normal),
          bodySmall: TextStyle(
              color: MyColors.textColor,
              fontSize: 23,
              fontFamily: 'Times New Roman',
              fontWeight: FontWeight.normal),
        ),
    );
  }
}