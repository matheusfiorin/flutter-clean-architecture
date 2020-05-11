import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../profile/profile_page.dart';
import '../../reports/reports_page.dart';
import '../page/home_page.dart';
import 'tabs_home_page_style.dart';

class TabsHomePage extends StatelessWidget {
  const TabsHomePage(
    this._createHomePage,
    this._createReportsPage,
    this._createProfilePage,
  );

  final HomePage Function() _createHomePage;
  final ReportsPage Function() _createReportsPage;
  final ProfilePage Function() _createProfilePage;

  static final _style = TabsHomePageStyle();

  Widget build(BuildContext context) {
    final pageFactoryFunctions = [
      _createHomePage,
      _createReportsPage,
      _createProfilePage
    ];

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: _style.tabBar.activeColor,
        inactiveColor: _style.tabBar.inactiveColor,
        items: [
          _item("Home", Icons.home),
          _item("Relatório", Icons.assessment),
          _item("Perfil", Icons.person),
        ],
      ),
      tabBuilder: (context, index) => pageFactoryFunctions[index](),
    );
  }

  BottomNavigationBarItem _item(String title, IconData icon) =>
      BottomNavigationBarItem(
        icon: Icon(icon),
        title: Text(title),
      );
}
