import 'package:flutter/material.dart';

enum ContentAlign { top, bottom, left, right }

class TargetShowcaseExplain {
  final ContentAlign contentAlign;
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
    required this.contentAlign,
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
    return 'TargetShowcaseExplain(contentAlign: $contentAlign, title: $title, leadTitle: $leadTitle)';
  }

  //Copy with
  TargetShowcaseExplain copyWith({
    ContentAlign? contentAlign,
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
      contentAlign: contentAlign ?? this.contentAlign,
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
