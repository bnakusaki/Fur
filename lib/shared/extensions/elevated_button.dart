import 'package:flutter/material.dart';
import 'package:fur/shared/widgets/app_loading_indicator.dart';

extension ElevatedButtonExtension on ElevatedButton {
  Widget withLoadingState({
    // required Future<void> Function() onPressed,
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
                  if (onPressed != null) {
                    loading.value = true;
                    await Future.sync(() => onPressed!());
                    loading.value = false;
                  }
                },
          onLongPress: explicitLoading ?? loading.value ? null : onLongPress,
          onFocusChange: explicitLoading ?? loading.value ? null : onFocusChange,
          focusNode: focusNode,
          style: style,
          child: explicitLoading ?? loading.value ? const AppLoadingIndicator() : this.child,
        );
      },
    );
  }
}
