import 'package:flutter/material.dart';
import 'package:fur/shared/styles/text_styles.dart';

class AppTheme {
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Montserrat',
      colorScheme: _colorScheme(),
      textTheme: _textTheme(),
      cardTheme: _cardTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      extensions: <ThemeExtension>{
        _textStyleExtension(),
      },
      elevatedButtonTheme: _elevatedButtonTheme(),
      appBarTheme: _appBarTheme(),
      snackBarTheme: _snackBarTheme(),
      textButtonTheme: _textButtonTheme(),
      listTileTheme: _listTileTheme(),
    );
  }

  ColorScheme _colorScheme() {
    return ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 24, 23, 29),
      primary: const Color.fromARGB(255, 24, 23, 29),
      scrim: const Color(0xFF0C0F0A),
      error: Colors.red,
      surface: Colors.grey,
    );
  }

  TextTheme _textTheme() {
    return const TextTheme(
      // displayLarge: TextStyle(fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
      // displaySmall: TextStyle(fontWeight: FontWeight.bold),
      // headlineLarge: TextStyle(fontWeight: FontWeight.bold),
      // headlineMedium: TextStyle(fontWeight: FontWeight.bold),
      // headlineSmall: TextStyle(fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontWeight: FontWeight.w600),
      // titleSmall: TextStyle(fontWeight: FontWeight.bold),
      // bodyLarge: TextStyle(fontWeight: FontWeight.bold),
      // bodyMedium: TextStyle(fontWeight: FontWeight.bold),
      // bodySmall: TextStyle(fontWeight: FontWeight.bold),
      labelLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    );
  }

  CardTheme _cardTheme() {
    return CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey.shade300,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey.shade500,
        ),
      ),
      errorStyle: const TextStyle(fontWeight: FontWeight.w500),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(
          width: 2,
          color: _colorScheme().error,
        ),
      ),
    );
  }

  TextStyles _textStyleExtension() {
    return TextStyles(
      h1: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: _colorScheme().primary,
        height: 1,
      ),
      h2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: _colorScheme().primary,
        height: 1,
      ),
      link: TextStyle(
        fontWeight: FontWeight.bold,
        color: _colorScheme().primary,
      ),
      emptyState: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade600,
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade600,
      ),
    );
  }

  ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: _colorScheme().primary,
          elevation: 0,
          foregroundColor: Colors.white,
          fixedSize: const Size.fromWidth(double.maxFinite),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
    );
  }

  AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  SnackBarThemeData _snackBarTheme() {
    return SnackBarThemeData(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // backgroundColor: Colors.red,
      contentTextStyle: TextStyle(color: _colorScheme().primary),
      backgroundColor: _colorScheme().primary.withOpacity(0.2),
      elevation: 0,
    );
  }

  TextButtonThemeData _textButtonTheme() {
    return const TextButtonThemeData();
  }

  ListTileThemeData _listTileTheme() {
    return ListTileThemeData(
      tileColor: Colors.white,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
