import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w400,
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
        WidgetState.selected: TextStyle(color: Colors.black),
        ~WidgetState.selected: TextStyle(color: Colors.black),
      }),
      iconTheme: WidgetStateProperty.fromMap({
        WidgetState.selected: IconThemeData(color: Colors.black),
        ~WidgetState.selected: IconThemeData(color: Colors.black),
      }),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    canvasColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w400,
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
        WidgetState.selected: TextStyle(color: Colors.white),
        ~WidgetState.selected: TextStyle(color: Colors.white),
      }),
      iconTheme: WidgetStateProperty.fromMap({
        WidgetState.selected: IconThemeData(color: Colors.white),
        ~WidgetState.selected: IconThemeData(color: Colors.white),
      }),
    ),
  );
}
