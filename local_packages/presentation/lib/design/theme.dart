import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'style.dart';

ThemeData materialThemeData() {
  final style = Style.current;

  final base = ThemeData(
    brightness: Brightness.light,
    //
    accentColor: style.button.positiveColor,
    //
    primaryColor: style.appBar.color,
    //
    scaffoldBackgroundColor: style.background.color,
    backgroundColor: style.background.color,
    //
    textTheme: TextTheme(
      body1: style.text.mdTextStyle,
      button: style.text.mdTextStyle,
    ),
    dividerColor: style.divider.color,
  );

  final modifiedThemeData = base.copyWith(
    //
    primaryTextTheme: base.primaryTextTheme.apply(
      bodyColor: style.text.contrastColor,
    ),
    //
    textTheme: base.textTheme.apply(
      bodyColor: style.text.color,
    ),
    //
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: style.button.positiveColor,
      textTheme: ButtonTextTheme.primary,
      padding: style.button.padding,
      shape: RoundedRectangleBorder(
        borderRadius: style.button.borderRadius,
      ),
    ),
  );

  return modifiedThemeData;
}

CupertinoThemeData cupertinoThemeData() {
  final style = Style.current;

  return CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: style.button.positiveColor,
    primaryContrastingColor: style.text.contrastColor,
    barBackgroundColor: style.appBar.color,
    scaffoldBackgroundColor: style.background.color,
    textTheme: CupertinoTextThemeData(
      textStyle: style.text.mdTextStyle,
      navTitleTextStyle: style.text.mdTextStyle.copyWith(color: Colors.white),
    ),
  );
}
