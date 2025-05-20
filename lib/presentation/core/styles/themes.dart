import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final mainTextLigth = const Color(0xff1D1B20);
  static final secondaryTextLight = const Color(0xff49454F);
  static final backgroundColorLight = const Color(0xffffffff);

  static final mainTextDark = const Color(0xffeeeeee);
  static final secondaryTextDark = const Color(0xffb3b3b3);
  static final backgroundColorDark = const Color(0xff121212);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    canvasColor: backgroundColorLight,
    scaffoldBackgroundColor: backgroundColorLight,
    textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            color: mainTextLigth,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            color: mainTextLigth,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            color: mainTextLigth,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            color: secondaryTextLight,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColorLight,
      iconTheme: IconThemeData(
        color: mainTextLigth,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: backgroundColorLight,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: backgroundColorLight,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    canvasColor: backgroundColorDark,
    scaffoldBackgroundColor: backgroundColorDark,
    textTheme: ThemeData.dark().textTheme.copyWith(
          titleLarge: TextStyle(
            color: mainTextDark,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            color: mainTextDark,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            color: mainTextDark,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            color: secondaryTextDark,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColorDark,
      iconTheme: IconThemeData(
        color: mainTextDark,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: backgroundColorDark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: backgroundColorDark,
    ),
  );
}
