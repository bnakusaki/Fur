import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

extension ElevatedButtonExtension on ElevatedButton {
  Widget withLoadingState({
    required Future<void> Function() onPressed,
    bool? explicitLoading,
  }) {
    ValueNotifier<bool> loading = ValueNotifier<bool>(false);

    return ListenableBuilder(
      listenable: loading,
      builder: (context, child) {
        return ElevatedButton(
          onHover: explicitLoading ?? loading.value ? null : onHover,
          onPressed: explicitLoading ?? loading.value
              ? null
              : () async {
                  loading.value = true;
                  await onPressed();
                  loading.value = false;
                },
          onLongPress: explicitLoading ?? loading.value ? null : onLongPress,
          onFocusChange: explicitLoading ?? loading.value ? null : onFocusChange,
          focusNode: focusNode,
          style: style,
          child: explicitLoading ?? loading.value
              ? const SizedBox(
                  height: 20,
                  child: LoadingIndicator(indicatorType: Indicator.circleStrokeSpin),
                )
              : this.child,
        );
      },
    );
  }
}
