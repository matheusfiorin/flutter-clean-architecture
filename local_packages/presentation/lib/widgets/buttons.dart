import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../design/style.dart';
import 'layout.dart';

Widget expandedPositiveButton(
  String data, {
  IconData icon,
  VoidCallback onPressed,
}) =>
    _expandedButton(data, icon: icon, onPressed: onPressed);

Widget expandedNeutralButton(
  String data, {
  IconData icon,
  VoidCallback onPressed,
}) =>
    _expandedButton(
      data,
      icon: icon,
      color: Style.current.button.neutralColor,
      onPressed: onPressed,
    );

Widget _expandedButton(
  String data, {
  IconData icon,
  Color color,
  VoidCallback onPressed,
}) =>
    _raisedButton(
      _expandedButtonContent(data, icon: icon),
      color: color,
      onPressed: onPressed,
    );

Widget _raisedButton(
  Widget child, {
  Color color,
  @required VoidCallback onPressed,
}) {
  if (Platform.isAndroid) {
    return RaisedButton(
      color: color,
      child: child,
      onPressed: onPressed,
    );
  } else {
    if (color == null) {
      return CupertinoButton.filled(
        child: child,
        onPressed: onPressed,
      );
    } else {
      return CupertinoButton(
        color: color,
        child: child,
        onPressed: onPressed,
      );
    }
  }
}

Widget _expandedButtonContent(
  String data, {
  IconData icon,
  TextStyle textStyle,
}) =>
    centeredRow(
      _buttonContent(data, icon: icon, textStyle: textStyle),
    );

List<Widget> _buttonContent(String data, {IconData icon, TextStyle textStyle}) {
  final buttonText = _buttonText(data, textStyle: textStyle);

  return (icon == null)
      ? [buttonText]
      : [
          Icon(icon),
          xsSpacer(),
          buttonText,
        ];
}

Widget _buttonText(String data, {TextStyle textStyle}) {
  final style = textStyle ?? Style.current.button.textStyle;
  return Text(data, style: style);
}
