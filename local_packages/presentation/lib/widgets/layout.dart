import 'package:flutter/widgets.dart';

import '../design/metrics.dart';

Widget xsSpacer() => _spacer(Metrics.spacing.xs);

Widget smSpacer() => _spacer(Metrics.spacing.sm);

Widget mdSpacer() => _spacer(Metrics.spacing.md);

Widget lgSpacer() => _spacer(Metrics.spacing.lg);

Widget xlSpacer() => _spacer(Metrics.spacing.xl);

Widget _spacer(double size) => SizedBox(height: size, width: size);

Widget lrPadding(Widget child) => Padding(
      padding: Metrics.layout.mdLeftRightPadding,
      child: child,
    );

Widget centeredRow(List<Widget> children) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
