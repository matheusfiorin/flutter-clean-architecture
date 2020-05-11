import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PageRoute pageRoute({Widget child}) {
  if (Platform.isAndroid) {
    return MaterialPageRoute(
      builder: (context) => child,
    );
  } else {
    return CupertinoPageRoute(
      builder: (context) => child,
    );
  }
}
