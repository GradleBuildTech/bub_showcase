import 'package:flutter/material.dart';

import 'showcase_explain.dart';

class TargetShowcaseFocus {
  final String? keyCheck;
  final GlobalKey? keyTarget;
  final double? radius;
  final Duration? focusAnimationDuration;
  final Duration? unFocusAnimationDuration;
  final TargetShowcaseExplain? explain;

  TargetShowcaseFocus({
    this.keyCheck,
    this.keyTarget,
    this.radius,
    this.focusAnimationDuration,
    this.unFocusAnimationDuration,
    this.explain,
  });

  @override
  String toString() {
    return 'TargetShowcaseFocus(keyTarget: $keyTarget, radius: $radius, focusAnimationDuration: $focusAnimationDuration, unFocusAnimationDuration: $unFocusAnimationDuration)';
  }
}
