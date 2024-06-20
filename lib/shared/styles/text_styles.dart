import 'package:flutter/material.dart';

class TextStyles extends ThemeExtension<TextStyles> {
  TextStyles({
    required this.h1,
    required this.h2,
    required this.link,
    required this.emptyState,
    required this.caption,
  });

  final TextStyle? h1;
  final TextStyle? h2;
  final TextStyle? link;
  final TextStyle? emptyState;
  final TextStyle? caption;

  @override
  ThemeExtension<TextStyles> copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? link,
    TextStyle? emptyState,
    TextStyle? caption,
  }) {
    return TextStyles(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      link: link ?? this.link,
      emptyState: emptyState ?? this.emptyState,
      caption: caption ?? this.caption,
    );
  }

  @override
  ThemeExtension<TextStyles> lerp(covariant ThemeExtension<TextStyles>? other, double t) {
    if (other is! TextStyles) return this;
    return TextStyles(
      h1: TextStyle.lerp(h1, other.h1, t),
      h2: TextStyle.lerp(h2, other.h2, t),
      link: TextStyle.lerp(link, other.link, t),
      emptyState: TextStyle.lerp(emptyState, other.emptyState, t),
      caption: TextStyle.lerp(caption, other.caption, t),
    );
  }
}
