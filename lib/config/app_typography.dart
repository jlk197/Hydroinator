import 'package:flutter/material.dart';
import 'package:hydroinator/config/app_colors.dart';

class AppTypography {
  static const TextStyle appBarStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

  static TextStyle highlightedStyle({Color? color}) => TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: color ?? Colors.black);

  static const TextStyle defaultStyle =
      TextStyle(fontSize: 15, color: Colors.black);

  static const TextStyle defaultBoldStyle =
      TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle validationErrorStyle =
      TextStyle(fontSize: 13, color: Colors.red);

  static const TextStyle titleStyle = TextStyle(
      fontSize: 18, color: AppColors.mainPurple, fontWeight: FontWeight.bold);

  static const TextStyle smallStyle =
      TextStyle(fontSize: 13, color: Colors.black);
}
