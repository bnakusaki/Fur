import 'package:flutter/widgets.dart';
import 'package:fur/common_libs.dart';

class Failure {
  final String code;

  Failure(this.code);

  @override
  String toString() => code;

  String message(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return switch (code) {
      _ => localizations.unknownError,
    };
  }
}
