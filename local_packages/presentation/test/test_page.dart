import 'package:flutter/material.dart';
import 'package:presentation/design/theme.dart';

class TestPage extends StatelessWidget {
  const TestPage({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => TestMaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: child,
          ),
        ),
      );
}

class TestMaterialApp extends StatelessWidget {
  const TestMaterialApp({@required this.home});

  final Widget home;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Test App',
        theme: materialThemeData(),
        home: home,
      );
}
