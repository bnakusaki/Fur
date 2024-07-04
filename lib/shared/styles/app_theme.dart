import 'package:flutter/material.dart';
import 'package:fur/shared/styles/text_styles.dart';

class AppTheme {
  ColorScheme _colorScheme() {
    return ColorScheme.fromSeed(
      seedColor: const Color(0xFFF85E00),
      primary: const Color(0xFFF85E00),
      scrim: const Color(0xFF0C0F0A),
      error: Colors.red,
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

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey.shade300,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey.shade500,
        ),
      ),
      errorStyle: const TextStyle(fontWeight: FontWeight.w500),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 2,
          color: _colorScheme().error,
        ),
      ),
    );
  }

  ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _colorScheme().primary,
        elevation: 0,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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

  TextButtonThemeData _textButtonTheme() {
    return TextButtonThemeData(
        style: TextButton.styleFrom(
      backgroundColor: _colorScheme().primary.withOpacity(0.1),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));
  }

  ListTileThemeData _listTileTheme() {
    return ListTileThemeData(
      tileColor: Colors.white,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
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
      textButtonTheme: _textButtonTheme(),
      listTileTheme: _listTileTheme(),
    );
  }
}
