import 'package:flutter/material.dart';

const _defaultDividerSize = 2.0;

Widget divider({double height = _defaultDividerSize}) =>
    Divider(height: height);

Widget verticalDivider({
  double width = _defaultDividerSize,
  EdgeInsetsGeometry padding,
}) {
  final divider = VerticalDivider(width: width);

  return (padding == null)
      ? divider
      : Padding(
          padding: padding,
          child: divider,
        );
}
