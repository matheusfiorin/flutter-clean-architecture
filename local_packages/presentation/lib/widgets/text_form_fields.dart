import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../design/metrics.dart';

Widget textFormField({
  String data,
  String labelText,
  IconData prefixIcon,
  bool obscureText = false,
  TextInputType keyboardType,
  TextInputAction textInputAction,
  int maxLength,
  TextEditingController textEditingController,
  ValueChanged<String> onChanged,
}) =>
    (Platform.isAndroid)
        // Android
        ? TextFormField(
            decoration: InputDecoration(
              labelText: labelText,
              counterText: '',
              border: OutlineInputBorder(),
              prefixIcon: Icon(prefixIcon),
            ),
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            maxLength: maxLength,
            controller: textEditingController,
            onChanged: onChanged,
          )
        // iOS
        : CupertinoTextField(
            placeholder: labelText,
            padding: EdgeInsets.fromLTRB(
              Metrics.spacing.xxs,
              Metrics.spacing.sm,
              Metrics.spacing.xxs,
              Metrics.spacing.sm,
            ),
            prefix: Container(
              padding: EdgeInsets.only(
                left: Metrics.spacing.xs,
                right: Metrics.spacing.xxs,
              ),
              child: Icon(prefixIcon),
            ),
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            maxLength: maxLength,
            controller: textEditingController,
            onChanged: onChanged,
          );
