import 'package:flutter/material.dart' show CircularProgressIndicator, ProgressIndicatorTheme;
import 'package:flutter_base_project/app/main/routing/screen_manager.dart';
import 'package:overlay_kit/overlay_kit.dart';

class LoadingProgress {
  LoadingProgress.start() {
    OverlayLoadingProgress.start(
      widget: CircularProgressIndicator(
        strokeWidth: 3,
        color: ProgressIndicatorTheme.of(Screens.instance.context!).color,
      ),
    );
  }

  LoadingProgress.stop() {
    OverlayLoadingProgress.stop();
  }
}
