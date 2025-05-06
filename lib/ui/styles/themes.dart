import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final mainTextLigth = const Color(0xff1D1B20);
  static final secondaryTextLight = const Color(0xff49454F);

  static final mainTextDark = const Color(0xffffffff);
  static final secondaryTextDark = const Color(0xffb3b3b3);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
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
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: mainTextLigth,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    canvasColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
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
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(
        color: mainTextDark,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.black,
    ),
  );
}
