import 'package:flutter/material.dart';

class SmoothPageIndicator extends StatelessWidget {
  const SmoothPageIndicator({
    super.key,
    this.count = 2,
    this.value = 0,
  });

  final int count;
  final int value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: index == value ? 12 : 8,
            height: index == value ? 12 : 8,
            decoration: BoxDecoration(
              color: index == value ? Theme.of(context).colorScheme.primary : Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
        itemCount: count,
      ),
    );
  }
}
