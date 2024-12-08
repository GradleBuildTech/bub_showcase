import 'package:bub_showcase/src/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'showcase/showcase_focus.dart';
import 'widgets/showcase_widget.dart';

/// Overlay to show guide line
/// [targets] list of [TargetShowcaseFocus]
/// [parentWidth] width of parent widget
/// [parentHeight] height of parent widget
/// [finish] callback when finished button clicked
class ShowcaseOverlay {
  final List<TargetShowcaseFocus> targets;
  final double parentWidth;
  final double parentHeight;
  final Function() finish;

  OverlayEntry? _overlayEntry;

  ShowcaseOverlay({
    required this.targets,
    required this.parentHeight,
    required this.parentWidth,
    required this.finish,
  });

  OverlayEntry _buildOverlay() {
    return OverlayEntry(
      builder: (context) {
        return ShowcaseWidget(
          targets: targets,
          parentHeight: parentHeight,
          parentWidth: parentWidth,
          onFinished: onFinished,
        );
      },
    );
  }

  void show({required BuildContext context}) {
    OverlayState? overlay = Overlay.of(context);
    postFrame(() {
      _createAndShow(overlay);
    });
  }

  void _createAndShow(OverlayState overlay) {
    if (_overlayEntry == null) {
      _overlayEntry = _buildOverlay();
      overlay.insert(_overlayEntry!);
    }
  }

  void onFinished() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    finish();
  }
}
