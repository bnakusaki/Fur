import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

extension IconButtonExtension on IconButton {
  Widget withLoadingState({
    required Future<void> Function() onPressed,
    bool? explicitLoading,
  }) {
    ValueNotifier<bool> loading = ValueNotifier<bool>(false);

    return ListenableBuilder(
      listenable: loading,
      builder: (context, child) {
        return IconButton.filled(
          onPressed: explicitLoading ?? loading.value
              ? null
              : () async {
                  loading.value = true;
                  await onPressed();
                  loading.value = false;
                },
          focusNode: focusNode,
          style: style,
          icon: explicitLoading ?? loading.value
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: LoadingIndicator(indicatorType: Indicator.circleStrokeSpin),
                )
              : icon,
        );
      },
    );
  }
}
