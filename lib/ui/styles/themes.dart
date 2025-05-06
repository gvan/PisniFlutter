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
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      labelTextStyle: WidgetStateProperty.fromMap({
        WidgetState.selected: TextStyle(color: mainTextLigth),
        ~WidgetState.selected: TextStyle(color: mainTextLigth),
      }),
      iconTheme: WidgetStateProperty.fromMap({
        WidgetState.selected: IconThemeData(color: mainTextLigth),
        ~WidgetState.selected: IconThemeData(color: mainTextLigth),
      }),
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
        color: Colors.white,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.black,
      labelTextStyle: WidgetStateProperty.fromMap({
        WidgetState.selected: TextStyle(color: mainTextDark),
        ~WidgetState.selected: TextStyle(color: mainTextDark),
      }),
      iconTheme: WidgetStateProperty.fromMap({
        WidgetState.selected: IconThemeData(color: mainTextDark),
        ~WidgetState.selected: IconThemeData(color: mainTextDark),
      }),
    ),
  );
}
