import 'package:flutter/material.dart';
import 'package:fur/shared/styles/text_styles.dart';

class AppTheme {
  ColorScheme _colorScheme() {
    return ColorScheme.fromSeed(
      seedColor: const Color(0xFFFF6700),
      primary: const Color(0xFFFF6700),
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
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey.shade300,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }

  ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _colorScheme().primary,
        elevation: 0,
        fixedSize: const Size(double.maxFinite, 45),
        foregroundColor: Colors.white,
        overlayColor: _colorScheme().surface,
      ),
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
        fontWeight: FontWeight.w500,
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

  CardTheme _cardTheme() {
    return CardTheme(
      elevation: 0,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 4,
        ),
      ),
      clipBehavior: Clip.hardEdge,
    );
  }

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme(),
      fontFamily: 'Montserrat',
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      extensions: <ThemeExtension>{
        _textStyleExtension(),
      },
      inputDecorationTheme: _inputDecorationTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(),
      appBarTheme: _appBarTheme(),
      snackBarTheme: _snackBarTheme(),
      cardTheme: _cardTheme(),
    );
  }
}
