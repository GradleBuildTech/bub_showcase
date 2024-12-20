import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get widthDevice => MediaQuery.of(this).size.width;
  double get heightDevice => MediaQuery.of(this).size.height;
  //bool
  bool get canPop => Navigator.maybeOf(this)?.canPop() ?? false;

  // text

  TextStyle get headerStyle => Theme.of(this).textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w400,
      );
  TextStyle get timeStyle => Theme.of(this).textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.bold,
      );
  TextStyle get textStyle => Theme.of(this).textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
        color: Theme.of(this).primaryColor,
      );
  TextStyle get bodyLargeStyle => Theme.of(this).textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w400,
        color: Theme.of(this).primaryColor,
      );
  TextStyle get subTextStyle => textStyle.copyWith(
        fontWeight: FontWeight.w400,
      );

  TextStyle get primaryMediumText =>
      Theme.of(this).textTheme.titleMedium!.copyWith(
            color: Theme.of(this).primaryColor,
            fontWeight: FontWeight.w600,
          );

  TextStyle get headlineMedium =>
      Theme.of(this).textTheme.headlineMedium!.copyWith();
  TextStyle get headlineLarge =>
      Theme.of(this).textTheme.headlineLarge!.copyWith();
  TextStyle get headlineSmall =>
      Theme.of(this).textTheme.headlineSmall!.copyWith();

  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!.copyWith(
        fontSize: 12.0,
      );
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!.copyWith(
        fontSize: 14.0,
      );
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!.copyWith(
        fontSize: 16.0,
      );
  TextStyle get titleLargeS20 => Theme.of(this).textTheme.titleLarge!.copyWith(
        fontSize: 20.0,
      );
  TextStyle get headerAppBarTextStyle =>
      Theme.of(this).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(this).scaffoldBackgroundColor,
          );

  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!.copyWith();
}
