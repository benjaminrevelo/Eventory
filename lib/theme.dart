import 'package:flutter/material.dart';

//This class helps accces colors for the entire application
class AppColors {
  static Color primaryColor = const Color.fromRGBO(255, 255, 255, 1);
  static Color primaryAccent = const Color.fromRGBO(255, 255, 255, 1);
  static Color secondaryColor = const Color.fromRGBO(255, 255, 255, 1);
  static Color secondaryAccent = const Color.fromRGBO(255, 255, 255, 1);
  static Color titleColor = const Color.fromRGBO(0, 0, 0, 1);
  static Color textColor = const Color.fromRGBO(0, 0, 0, 1);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromRGBO(212, 172, 13, 13);
}

//set the color for the entire application so that everything looks good from start
ThemeData primaryTheme = ThemeData(
  //seed color
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

  //scaffold color
  scaffoldBackgroundColor: AppColors.secondaryAccent,

  //app bar colors
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.textColor,
    centerTitle: true,
  ),

  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
      letterSpacing: 1,
    ),
    headlineMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
    titleMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
  ),

  //card theme
  cardTheme: CardThemeData(
    color: AppColors.secondaryColor.withValues(alpha: .5),
    shape: const RoundedRectangleBorder(),
    shadowColor: Colors.transparent,
    margin: const EdgeInsets.only(bottom: 16),
  ),
);
