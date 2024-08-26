import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppSmoothIndicator extends StatelessWidget {
  const AppSmoothIndicator({
    super.key,
    required this.offset,
    required this.count,
  });
  final double offset;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SmoothIndicator(
      offset: offset,
      count: count,
      effect: ExpandingDotsEffect(
        dotHeight: 5,
        dotWidth: 5,
        spacing: 5,
        expansionFactor: 8,
        activeDotColor: Colors.white,
        dotColor: theme.colorScheme.surface,
      ),
      size: const Size(50, 10),
    );
  }
}
