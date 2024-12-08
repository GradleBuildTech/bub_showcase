import 'package:flutter/cupertino.dart';

double calculateSizeBoxHeight(GlobalKey? widgetKey, double parentHeight) {
  final RenderBox renderBox =
      widgetKey?.currentContext?.findRenderObject() as RenderBox;
  final size = renderBox.size;
  final offset = renderBox.localToGlobal(Offset.zero);

  final distanceFromBottom = parentHeight - (offset.dy + size.height);
  return distanceFromBottom;
}

void postFrame(VoidCallback callback) {
  Future.delayed(Duration.zero, callback);
}