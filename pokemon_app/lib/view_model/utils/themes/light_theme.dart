import 'package:flutter/material.dart';
import 'package:pokemon_app/view_model/utils/colors/colors.dart';

import 'numbers.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  appBarTheme: AppBarTheme(
      color: AppColors.primaryColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: Numbers.largeMeduim,
        fontWeight: FontWeight.bold,
      )),
  //iconTheme: IconThemeData(color: AppColors.white, size: 25),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        color: AppColors.black,
        fontSize: Numbers.largeFont,
        fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(
        color: AppColors.black,
        fontSize: Numbers.meduimFont,
        fontWeight: FontWeight.bold),
    bodySmall: TextStyle(
        color: AppColors.black,
        fontSize: Numbers.smallFont,
        fontWeight: FontWeight.w500
    ),
    titleMedium: TextStyle(
        color: AppColors.black,
        fontSize: Numbers.largeMeduim,
        fontWeight: FontWeight.bold),
  ),
);
