import 'package:flutter/material.dart';

import 'app_color.dart';

export 'app_font.dart';
export 'app_color.dart';

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Poppins',
        ),
    primaryTextTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Poppins',
        ),
    brightness: Brightness.dark,
    primaryColor: AppColor.primary,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primary,
      disabledColor: Colors.grey,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColor.primary,
      titleTextStyle: TextStyle(
        color: AppColor.white,
        fontSize: 18,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.grey1,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColor.grey1,
      selectedItemColor: AppColor.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.primary,
    ),
  );
}

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Poppins',
        ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Poppins',
        ),
    brightness: Brightness.light,
    primaryColor: AppColor.primary,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primary,
      disabledColor: Colors.grey,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColor.primary,
      titleTextStyle: TextStyle(
        color: AppColor.white,
        fontSize: 18,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColor.white,
      selectedItemColor: AppColor.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.primary,
    ),
  );
}
