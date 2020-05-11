import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Widget application({
  @required String title,
  @required ThemeData materialThemeData,
  @required CupertinoThemeData cupertinoThemeData,
  @required GlobalKey<NavigatorState> navigatorKey,
  @required Widget home,
}) {
  final localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  if (Platform.isAndroid) {
    return MaterialApp(
      theme: materialThemeData,
      title: title,
      navigatorKey: navigatorKey,
      localizationsDelegates: localizationsDelegates,
      home: home,
    );
  } else {
    return CupertinoApp(
      theme: cupertinoThemeData,
      title: title,
      navigatorKey: navigatorKey,
      localizationsDelegates: localizationsDelegates,
      home: home,
    );
  }
}
