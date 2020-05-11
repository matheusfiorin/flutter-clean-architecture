import 'package:flutter/material.dart';

import 'page_route.dart';

class NavigationStack {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  NavigatorState get _navigatorState => navigatorKey.currentState;

  void pushAsHome(Widget page) {
    _navigatorState.pushAndRemoveUntil(
      pageRoute(child: page),
      (route) => false,
    );
  }

  void push(Widget page) {
    _navigatorState.push(pageRoute(child: page));
  }

  void pushReplacement(Widget page) {
    _navigatorState.pushReplacement(pageRoute(child: page));
  }

  void pop() {
    _navigatorState.pop();
  }
}
