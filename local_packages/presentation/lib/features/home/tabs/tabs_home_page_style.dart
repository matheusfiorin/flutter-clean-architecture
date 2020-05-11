import 'package:flutter/widgets.dart';

import '../../../design/style.dart';

class TabsHomePageStyle {
  final _TabBar tabBar = _TabBar();
}

class _TabBar {
  final Color activeColor = Style.current.tabBar.activeColor;
  final Color inactiveColor = Style.current.tabBar.inactiveColor;
}
