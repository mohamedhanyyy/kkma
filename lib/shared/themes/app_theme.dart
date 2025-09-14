import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/colors.dart';

class AppThemes {

  static ThemeData whiteTheme = ThemeData(

    dropdownMenuTheme:
        const DropdownMenuThemeData(textStyle: TextStyle(color: Colors.black)),
    hintColor: AppColors.blackColor,
    dividerTheme: const DividerThemeData(color: Colors.transparent),
    fontFamily: 'Alexandria',
    primaryColor: AppColors.blackColor,
    scaffoldBackgroundColor: const Color(0xffFAFAFA),
    cardColor: AppColors.whiteColor,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
     textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) => Colors.white)
      ),),
     textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'Alexandria',
      ),
      titleMedium: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'Alexandria',
      ),
      titleSmall: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'Alexandria',
      ),
      bodyLarge: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'Alexandria',
      ),
      bodyMedium: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'Alexandria',
      ),
      bodySmall: TextStyle(
        color: AppColors.blackColor,
        fontFamily: 'Alexandria',
      ),
    ),
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(size: 13.sp),
      titleSpacing: 0,
      elevation: 0,
      backgroundColor: AppColors.grey,
    ),
    secondaryHeaderColor: AppColors.whiteColor,
    highlightColor: Colors.transparent,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: AppColors.blackColor),
    hoverColor: Colors.transparent,

  );
}
