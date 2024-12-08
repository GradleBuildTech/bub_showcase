import 'package:flutter/material.dart';

import 'showcase_position.dart';

class TargetShowcaseExplain {
  final ShowcasePosition showcasePosition;
  final String title;
  final String leadTitle;
  final double? width;
  final double? height;
  final Color? groundColor;
  final TextStyle? titleStyle;
  final TextStyle? leadTitleStyle;

  final Color? groundButtonColor;
  final TextStyle? buttonStyle;

  TargetShowcaseExplain({
    required this.showcasePosition,
    required this.title,
    required this.leadTitle,
    this.width,
    this.height,
    this.groundColor,
    this.titleStyle,
    this.leadTitleStyle,
    this.groundButtonColor,
    this.buttonStyle,
  });

  @override
  String toString() {
    return 'TargetShowcaseExplain(ShowcasePosition: $showcasePosition, title: $title, leadTitle: $leadTitle)';
  }

  //Copy with
  TargetShowcaseExplain copyWith({
    ShowcasePosition? showcasePosition,
    String? title,
    String? leadTitle,
    double? width,
    double? height,
    Color? groundColor,
    TextStyle? titleStyle,
    TextStyle? leadTitleStyle,
    Color? groundButtonColor,
    TextStyle? buttonStyle,
  }) {
    return TargetShowcaseExplain(
      showcasePosition: showcasePosition ?? this.showcasePosition,
      title: title ?? this.title,
      leadTitle: leadTitle ?? this.leadTitle,
      width: width ?? this.width,
      height: height ?? this.height,
      groundColor: groundColor ?? this.groundColor,
      titleStyle: titleStyle ?? this.titleStyle,
      leadTitleStyle: leadTitleStyle ?? this.leadTitleStyle,
      groundButtonColor: groundButtonColor ?? this.groundButtonColor,
      buttonStyle: buttonStyle ?? this.buttonStyle,
    );
  }
}
