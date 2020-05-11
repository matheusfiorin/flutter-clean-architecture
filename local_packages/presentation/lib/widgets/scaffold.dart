import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget appBar(String title, {String previousPageTitle}) {
  final titleWidget = Text(title);

  if (Platform.isAndroid) {
    return AppBar(title: titleWidget);
  } else {
    return CupertinoNavigationBar(
      middle: titleWidget,
      previousPageTitle: previousPageTitle ?? "",
      transitionBetweenRoutes: false,
    );
  }
}

Widget scaffold({
  Widget appBar,
  Widget drawer,
  @required Widget body,
}) {
  if (Platform.isAndroid) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: body,
    );
  } else {
    return CupertinoPageScaffold(
      navigationBar: appBar,
      child: body,
    );
  }
}

Widget keyboardHider(BuildContext context, Widget child) => GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: child,
    );
