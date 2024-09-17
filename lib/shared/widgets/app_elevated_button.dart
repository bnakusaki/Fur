import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppElevatedButton extends HookWidget {
  const AppElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.invertColors = false,
  });

  final Widget child;
  final void Function() onPressed;
  final bool invertColors;

  factory AppElevatedButton.icon({
    required Widget icon,
    required Widget label,
    required void Function() onPressed,
    bool invertColors = false,
  }) {
    return AppElevatedButton(
      onPressed: onPressed,
      invertColors: invertColors,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: icon,
          ),
          label,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaleController = useAnimationController(
      duration: Durations.short3,
      initialValue: 1,
      lowerBound: 0.95,
    );

    return ScaleTransition(
      scale: scaleController,
      child: GestureDetector(
        onTapDown: (_) async {
          await scaleController.reverse();
        },
        onTapCancel: () async {
          await scaleController.forward();
        },
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: invertColors ? theme.colorScheme.primary : null,
            foregroundColor: invertColors ? Colors.white : null,
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
