import 'package:flutter/material.dart';
import 'package:players/core/utils/app_font.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_value.dart';

ThemeData appTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.backgroundColorAppBar,
      elevation: AppSize.s0,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: AppFontSize.s18),
    ),
    scaffoldBackgroundColor: AppColors.backgroundColorScaffold,
  );
}
