import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
      child: LoadingIndicator(indicatorType: Indicator.ballRotateChase),
    );
  }
}
