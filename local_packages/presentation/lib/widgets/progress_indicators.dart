import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget progressIndicator() => (Platform.isAndroid)
    // Android
    ? CircularProgressIndicator()
    // iOS
    : CupertinoActivityIndicator(radius: 18.0);

Widget centeredProgressIndicator() => Center(
      child: progressIndicator(),
    );
