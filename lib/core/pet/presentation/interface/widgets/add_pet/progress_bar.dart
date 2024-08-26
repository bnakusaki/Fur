import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.progressCounter,
  });

  final ValueNotifier<int> progressCounter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            width: progressCounter.value == 0 ? 5 : screenWidth * (progressCounter.value / 5),
            height: 5,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: theme.primaryColor,
            ),
            duration: const Duration(milliseconds: 500),
          ),
        ),
      ],
    );
  }
}
