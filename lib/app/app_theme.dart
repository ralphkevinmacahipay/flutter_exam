import 'package:flutter/material.dart';
import 'package:flutter_exam/app/app_colors.dart';

class AppTheme {
  const AppTheme._();

  factory AppTheme.getInstance() => const AppTheme._();

  // ADD THEMES HERE
  ThemeData getTheme() => ThemeData(
          textTheme: const TextTheme(
        //
        displaySmall: TextStyle(color: AppColors.black, fontSize: 25),
      ));
}
